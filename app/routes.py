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
            cursor.execute('''SELECT id, nama, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan
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
            'nama': request.form['nama'],
            'alamat': request.form['alamat'],
            'no_identitas': request.form['no_identitas'],
            'tgl_pendaftaran': request.form['tgl_pendaftaran'],
            'status_keanggotaan': request.form['status_keanggotaan']
        }
        conn = create_connection()
        if conn:
            cursor = conn.cursor()
            try:
                cursor.execute('''INSERT INTO Anggota (id, nama, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan)
                                   VALUES (?, ?, ?, ?, ?, ?)''', 
                                   (anggota_data['id'], anggota_data['nama'], anggota_data['alamat'],
                                    anggota_data['no_identitas'], anggota_data['tgl_pendaftaran'], anggota_data['status_keanggotaan']))
                conn.commit()
                flash('Anggota added successfully!', 'success')
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
                    'nama': request.form['nama'],
                    'alamat': request.form['alamat'],
                    'no_identitas': request.form['no_identitas'],
                    'tgl_pendaftaran': request.form['tgl_pendaftaran'],
                    'status_keanggotaan': request.form['status_keanggotaan']
                }
                cursor.execute('''UPDATE Anggota
                                  SET nama = ?, alamat = ?, no_identitas = ?, tgl_pendaftaran = ?, status_keanggotaan = ?
                                  WHERE id = ?''', 
                                  (updated_data['nama'], updated_data['alamat'], updated_data['no_identitas'],
                                   updated_data['tgl_pendaftaran'], updated_data['status_keanggotaan'], id))
                conn.commit()
                flash('Anggota updated successfully!', 'success')
                return redirect(url_for('routes.anggota'))

            cursor.execute('SELECT id, nama, alamat, no_identitas, tgl_pendaftaran, status_keanggotaan FROM anggota WHERE id = ?', (id,))
            table = cursor.fetchone()
            if not table:
                flash('Table not found!', 'danger')
                return redirect(url_for('routes.anggota'))
            return render_template('editAnggota.html', table=dict(zip(['id', 'nama', 'alamat', 'no_identitas', 'tgl_pendaftaran', 'status_keanggotaan'], table)))
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

# TABLE JABATAN
@routes.route('/jabatan')
def jabatan():
    page = request.args.get('page', 1, type=int)
    per_page = 10  # Number of items per page
    offset = (page - 1) * per_page
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute('''SELECT id_jabatan, jabatan
                               FROM Jabatan
                               ORDER BY id_jabatan
                               OFFSET ? ROWS FETCH NEXT ? ROWS ONLY''', (offset, per_page))
            table = cursor.fetchall()
            cursor.execute('SELECT COUNT(*) FROM Jabatan')
            total_count = cursor.fetchone()[0]
            total_pages = (total_count + per_page - 1) // per_page
            return render_template('jabatan.html', table=table, total_pages=total_pages, current_page=page)
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Failed to connect to the database', 'danger')
        return render_template('jabatan.html', table=None)
    
@routes.route('/jabatan/create', methods=['GET', 'POST'])
def create_jabatan():
    if request.method == 'POST':
        jabatan_data = {
            'id_jabatan': request.form['id_jabatan'],
            'jabatan': request.form['jabatan']
        }
        conn = create_connection()
        if conn:
            cursor = conn.cursor()
            try:
                cursor.execute('''INSERT INTO Jabatan (id_jabatan, jabatan)
                                   VALUES (?, ?)''', 
                                   (jabatan_data['id_jabatan'], jabatan_data['jabatan']))
                conn.commit()
                flash('Jabatan added successfully!', 'success')
                return redirect(url_for('routes.jabatan'))
            except Exception as e:
                flash(f'Error: {str(e)}', 'danger')
            finally:
                cursor.close()
                conn.close()
    return render_template('createJabatan.html')

@routes.route('/jabatan/update/<id>', methods=['GET', 'POST'])
def update_jabatan(id):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            if request.method == 'POST':
                updated_data = {
                    'jabatan': request.form['jabatan'],
                }
                
                cursor.execute('''UPDATE Jabatan
                                  SET jabatan = ?
                                  WHERE id_jabatan = ?''', 
                                  updated_data['jabatan'], id)
                conn.commit()

                flash('Jabatan updated successfully!', 'success')
                return redirect(url_for('routes.jabatan'))

            cursor.execute('SELECT id_jabatan, jabatan FROM jabatan WHERE id_jabatan = ?', (id,))
            table = cursor.fetchone()
            if not table:
                flash('Jabatan not found!', 'danger')
                return redirect(url_for('routes.jabatan'))
            
            return render_template('editJabatan.html', table=dict(zip(['id_jabatan', 'jabatan'], table)))

        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Error: Unable to connect to the database.', 'danger')
        return redirect(url_for('routes.jabatan'))

@routes.route('/jabatan/delete/<id>', methods=['POST'])
def delete_jabatan(id):
    conn = create_connection()
    if conn:
        cursor = conn.cursor()
        try:
            cursor.execute('DELETE FROM Jabatan WHERE id_jabatan = ?', (id,))
            conn.commit()
            flash('Jabatan deleted successfully!', 'success')
        except Exception as e:
            flash(f'Error: {str(e)}', 'danger')
        finally:
            cursor.close()
            conn.close()
    else:
        flash('Error: Unable to connect to the database.', 'danger')
    return redirect(url_for('routes.jabatan'))