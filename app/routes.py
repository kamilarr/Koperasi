from flask import Blueprint, render_template, redirect, url_for, request, flash
from connect import create_connection

routes = Blueprint('routes', __name__)

def execute_query(query, params=(), fetchone=False):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute(query, params)
            if fetchone:
                return cursor.fetchone() 
            else:
                if query.strip().upper().startswith(("INSERT", "UPDATE", "DELETE")):
                    conn.commit()  
                return cursor.fetchall()
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')  
            return None  
        finally:
            cursor.close() 
            conn.close()    
    else:
        flash('Failed to connect to the database', 'danger')
    return None

# Generic CRUD routes
def create_route(table_name, fields):
    @routes.route(f'/{table_name}/create', methods=['GET', 'POST'], endpoint=f'{table_name}_create')
    def create_item():
        if request.method == 'POST':
            data = {field: request.form[field] for field in fields}
            execute_query(f'INSERT INTO {table_name} ({", ".join(fields)}) VALUES ({", ".join(["?"] * len(fields))})', tuple(data.values()))
            flash(f'{table_name.capitalize()} added successfully!', 'success')
            return redirect(url_for(f'routes.{table_name}_list'))
        return render_template('update.html', action='create', table_name=table_name, fields=fields, is_new=True)
    
def update_route(table_name, fields):
    @routes.route(f'/{table_name}/update/<id>', methods=['GET', 'POST'], endpoint=f'{table_name}_update')
    def update_item(id):
        if request.method == 'POST':
            data = {field: request.form[field] for field in fields[1:]}
            execute_query(f'UPDATE {table_name} SET {", ".join([f"{field} = ?" for field in fields[1:]])} WHERE {fields[0]} = ?', (*data.values(), id))
            flash(f'{table_name.capitalize()} updated successfully!', 'success')
            return redirect(url_for(f'routes.{table_name}_list'))

        item = execute_query(f'SELECT * FROM {table_name} WHERE {fields[0]} = ?', (id,), fetchone=True)
        if not item:
            flash(f'{table_name.capitalize()} not found!', 'danger')
            return redirect(url_for(f'routes.{table_name}_list'))
        return render_template('update.html', action='update', table_name=table_name, fields=fields, table=dict(zip(fields, item)))
     
def delete_route(table_name, fields):
    @routes.route(f'/{table_name}/delete/<id>', methods=['POST'], endpoint=f'{table_name}_delete')
    def delete_item(id):
        execute_query(f'DELETE FROM {table_name} WHERE {fields[0]} = ?', (id,))
        flash(f'{table_name.capitalize()} with ID {id} deleted successfully!', 'success')
        return redirect(url_for(f'routes.{table_name}_list'))

def list_route(table_name, fields):
    @routes.route(f'/{table_name}', endpoint=f'{table_name}_list')
    def list_items():
        page = request.args.get('page', 1, type=int)
        per_page = 10
        offset = (page - 1) * per_page
        items = execute_query(f'SELECT * FROM {table_name} ORDER BY {fields[0]} OFFSET ? ROWS FETCH NEXT ? ROWS ONLY', (offset, per_page))
        if items is None:
            items = []  
        total_count_result = execute_query(f'SELECT COUNT(*) FROM {table_name}')
        if total_count_result is not None:
            total_count = total_count_result[0][0]
        else:
            total_count = 0  
        total_pages = (total_count + per_page - 1) // per_page
        return render_template('read.html', table_name=table_name, fields=fields, table=items, total_pages=total_pages, current_page=page)

# Define your tables and fields
tables = {
    'Anggota': ['id_anggota', 'nama', 'alamat', 'no_identitas', 'tgl_pendaftaran', 'status_keanggotaan'],
    'Jabatan': ['id_jabatan', 'jabatan'],
    'Pengurus': ['id_anggota', 'id_jabatan'],
    'Transaksi': ['id_transaksi', 'id_anggota', 'jumlah', 'jenis_transaksi', 'tanggal_transaksi'],
    'Simpanan': ['id_simpanan', 'id_anggota', 'jumlah', 'tgl_pembukaan', 'jenis_simpanan', 'saldo'],
    'Pinjaman': ['id_pinjaman', 'id_anggota', 'jenis_pinjaman', 'saldo', 'bunga', 'jadwal_pembayaran', 'status_pinjaman', 'jumlah'],
    'Pinjaman Usaha': ['id_pinjaman', 'id_transaksi', 'jenis_usaha'],
    'Pinjaman Konsumsi': ['id_pinjaman', 'id_transaksi', 'jenis_konsumsi'],
    'SHU': ['id_shu', 'id_transaksi', 'kontribusi', 'tahun'],
    'Simpanan Pokok': ['id_simpanan', 'id_transaksi', 'status'],
    'Simpanan Bebas': ['id_simpanan', 'id_transaksi', 'bunga'],
    'Simpanan Wajib': ['id_simpanan', 'id_transaksi', 'bulan_pembayaran']
}

# Register routes for each table
for table_name, fields in tables.items():
    list_route(table_name, fields)
    create_route(table_name, fields)
    update_route(table_name, fields)
    delete_route(table_name, fields)

@routes.route('/')
def index():
    return render_template('home.html', tables=tables)