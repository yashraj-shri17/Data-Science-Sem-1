from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Ankit@12'
app.config['MYSQL_DB'] = 'student_registration'

mysql = MySQL(app)

@app.route('/')
def registration_form():
    return render_template('registration_form.html')

@app.route('/register', methods=['POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        age = request.form['age']
        father_name = request.form['father_name']
        mother_name = request.form['mother_name']
        phone_no = request.form['phone_no']
        DOB = request.form['DOB']
        blood_group = request.form['blood_group']
        address = request.form['address']
        department = request.form['department']
        course = request.form['course']
        password = request.form['password']

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO students (name, email, age, father_name, mother_name, phone_no, DOB, blood_group, address, department, course, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                    (name, email, age, father_name, mother_name, phone_no, DOB, blood_group, address, department, course, password))
        mysql.connection.commit()
        cur.close()

        return render_template('success.html')

if __name__ == '__main__':
    app.run(debug=True)
