from flask import Blueprint, render_template, redirect, url_for, request, flash
from connect import create_connection

# Create a blueprint for modular routing
routes = Blueprint('routes', __name__)

@routes.route('/')
def index():
    return render_template('home.html')

@routes.route('/anggota')
def anggota():
    page = request.args.get('page', 1, type=int)
    per_page = 10  # Number of items per page
    offset = (page - 1) * per_page
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute('''SELECT id, name, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan
                               FROM Anggota
                               ORDER BY id
                               OFFSET ? ROWS FETCH NEXT ? ROWS ONLY''', (offset, per_page))
            table = cursor.fetchall()
            cursor.execute('SELECT COUNT(*) FROM Anggota')
            total_count = cursor.fetchone()[0]
            total_pages = (total_count + per_page - 1) // per_page
            return render_template('anggota.html', table=table, total_pages=total_pages, current_page=page)
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Failed to connect to the database', 'danger')
        return render_template('anggota.html', table=None)

@routes.route('/anggota/create', methods=['GET', 'POST'])
def create_anggota():
    if request.method == 'POST':
        anggota_data = {
            'id': request.form['id'],
            'name': request.form['name'],
            'alamat': request.form['alamat'],
            'no_identitas': request.form['no_identitas'],
            'tgl_pendaftaran': request.form['tgl_pendaftaran'],
            'status_keanggotaan': request.form['status_keanggotaan']
        }
        conn = create_connection()
        if conn:
            cursor = conn.cursor()
            try:
                cursor.execute('''INSERT INTO Anggota (id, name, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan)
                                   VALUES (?, ?, ?, ?, ?, ?)''', 
                                   (anggota_data['id'], anggota_data['name'], anggota_data['alamat'],
                                    anggota_data['no_identitas'], anggota_data['tgl_pendaftaran'], anggota_data['status_keanggotaan']))
                conn.commit()
                flash('TableA added successfully!', 'success')
                return redirect(url_for('routes.anggota'))
            except Exception as e:
                flash(f'Error: {str(e)}', 'danger')
            finally:
                cursor.close()
                conn.close()

    return render_template('createAnggota.html')

@routes.route('/anggota/update/<id>', methods=['GET', 'POST'])
def update_anggota(id):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            if request.method == 'POST':
                updated_data = {
                    'name': request.form['name'],
                    'alamat': request.form['alamat'],
                    'no_identitas': request.form['no_identitas'],
                    'tgl_pendaftaran': request.form['tgl_pendaftaran'],
                    'status_keanggotaan': request.form['status_keanggotaan']
                }
                cursor.execute('''UPDATE Anggota
                                  SET name = ?, alamat = ?, no_identitas = ?, tgl_pendaftaran = ?, status_keanggotaan = ?
                                  WHERE id = ?''', 
                                  (updated_data['name'], updated_data['alamat'], updated_data['no_identitas'],
                                   updated_data['tgl_pendaftaran'], updated_data['status_keanggotaan'], id))
                conn.commit()
                flash('Anggota updated successfully!', 'success')
                return redirect(url_for('routes.anggota'))

            cursor.execute('SELECT id, name, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan FROM Anggota WHERE id = ?', (id,))
            table = cursor.fetchone()
            if not table:
                flash('Table not found!', 'danger')
                return redirect(url_for('routes.anggota'))
            return render_template('editAnggota.html', table=dict(zip(['id', 'name', 'alamat', 'no_identitas', 'tgl_pendaftaran', 'status_keanggotaan'], table)))
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Error: Unable to connect to the database.', 'danger')
        return redirect(url_for('routes.anggota'))

@routes.route('/anggota/delete/<id>', methods=['POST'])
def delete_anggota(id):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute('DELETE FROM Anggota WHERE id = ?', (id,))
            conn.commit()
            flash('Anggota deleted successfully!', 'success')
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Error: Unable to connect to the database.', 'danger')
    return redirect(url_for('routes.anggota'))

# The routes for Pengurus (same structure as TableA but for a different table)
@routes.route('/Pengurus')
def Pengurus():
    page = request.args.get('page', 1, type=int)
    per_page = 10
    offset = (page - 1) * per_page
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute('''SELECT id_jabatan, jabatan, id_anggota
                               FROM Pengurus
                               ORDER BY id
                               OFFSET ? ROWS FETCH NEXT ? ROWS ONLY''', (offset, per_page))
            table = cursor.fetchall()
            cursor.execute('SELECT COUNT(*) FROM Pengurus')
            total_count = cursor.fetchone()[0]
            total_pages = (total_count + per_page - 1) // per_page
            return render_template('Pengurus.html', table=table, total_pages=total_pages, current_page=page)
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Failed to connect to the database', 'danger')
        return render_template('Pengurus.html', table=None)

@routes.route('/Pengurus/create', methods=['GET', 'POST'])
def create_Pengurus():
    if request.method == 'POST':
        Pengurus_data = {
            'id_jabatan': request.form['id_jabatan'],
            'jabatan': request.form['jabatan'],
            'id_anggota': request.form['id_anggota'],
        }
        conn = create_connection()
        if conn:
            cursor = conn.cursor()
            try:
                cursor.execute('''INSERT INTO Pengurus (id_jabatan, jabatan, id_anggota)
                                   VALUES (?, ?, ?)''', 
                                   (Pengurus_data['id_jabatan'], Pengurus_data['jabatan'], Pengurus_data['id_anggota'],))
                conn.commit()
                flash('Pengurus added successfully!', 'success')
                return redirect(url_for('routes.Pengurus'))
            except Exception as e:
                flash(f'Error: {str(e)}', 'danger')
            finally:
                cursor.close()
                conn.close()

    return render_template('createPengurus.html')

@routes.route('/Pengurus/update/<id>', methods=['GET', 'POST'])
def update_Pengurus(id):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            if request.method == 'POST':
                updated_data = {
                    'id_jabatan': request.form['id_jabatan'],
                    'jabatan': request.form['jabatan'],
                    'id_anggota': request.form['id_anggota'],
                }
                cursor.execute('''UPDATE Pengurus
                                  SET id_jabatan = ?, jabatan = ?, id_anggota = ?''', 
                                  (updated_data['id_jabatan'], updated_data['jabatan'], updated_data['id_anggota'], id))
                conn.commit()
                flash('Pengurus updated successfully!', 'success')
                return redirect(url_for('routes.Pengurus'))

            cursor.execute('SELECT id_jabatan, jabatan, id_anggota FROM Pengurus WHERE id = ?', (id,))
            table = cursor.fetchone()
            if not table:
                flash('Table not found!', 'danger')
                return redirect(url_for('routes.Pengurus'))
            return render_template('editPengurus.html', table=dict(zip(['id_jabatan', 'jabatan', 'id_anggota'], table)))
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Error: Unable to connect to the database.', 'danger')
        return redirect(url_for('routes.Pengurus'))

@routes.route('/Pengurus/delete/<id>', methods=['POST'])
def delete_Pengurus(id):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute('DELETE FROM Pengurus WHERE id = ?', (id,))
            conn.commit()
            flash('Pengurus deleted successfully!', 'success')
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Error: Unable to connect to the database.', 'danger')
    return redirect(url_for('routes.Pengurus'))
