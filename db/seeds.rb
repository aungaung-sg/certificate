# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "admin@mail.com", password: "password", password_confirmation: "password", admin: true, name: "admin")
User.create(email: "pyay@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Pyay")
User.create(email: "paukkhaung@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Pauk Khaung")
User.create(email: "magway@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Magway")
User.create(email: "dawei@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Dawei")
User.create(email: "minhla@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Min Hla")
User.create(email: "pakokku@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Pakokku")
User.create(email: "nattalin@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Nattalin")
User.create(email: "aunglan@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Aung Lan")
User.create(email: "tamwe@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Tamwe")
User.create(email: "tingunkyun@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Thingunkyun")
User.create(email: "Latha@mail.com", password: "password", password_confirmation: "password", admin: false, name: "Latha")

#pyay
Course.create(name: "Office 2016 Course", title: "Office 2016 Course(Pyay)",  description: "Window's 10 \n Microsoft Word 2016 \n Microsoft Excel 2016 \n Microsoft Power Point 2016 \n Internet and E-mail \n Printing", user_id: User.find_by(name: "Pyay").id)
Course.create(name: "D.T.P Course", title: "D.T.P Course(Pyay)", description: "Corel Draw X4 \n Adobe Photoshop C.S.3 \n Adobe Page Maker 7.0 \n Adobe Acrobat 7.0 \n Printing", user_id: User.find_by(name: "Pyay").id)
Course.create(name: "Advanced Excel 2016 Course", title: "Advanced Excel 2016 Course(Pyay)", description: "Advanced Excel 2016", user_id: User.find_by(name: "Pyay").id)
Course.create(name: "MYOB Course", description: "MYOB", title:  "MYOB Course(Pyay)", user_id: User.find_by(name: "Pyay").id)
Course.create(name: "AutoCAD Course", description: "AutoCAD (General)", title: "AutoCAD Course(Pyay)", user_id: User.find_by(name: "Pyay").id)
Course.create(name: " Professional Excel Course", title: " Professional Excel Course(Pyay)", description: "Professional Excel", user_id: User.find_by(name: "Pyay").id)

#pauk khaung
Course.create(name: "Office 2010 Course", title: "Office 2010 Course(Pauk Khaung)", description: "Window's 7 \n Microsoft Word 2010 \n Microsoft Excel 2010 \n Microsoft Power Point 2010 \n Scanning and Printing", user_id: User.find_by(name: "Pauk Khaung").id)

#magway
Course.create(name: "Office 2016 Course", title: "Office 2016 Course(Magway)", description: "Window's 10 \n Microsoft Word 2016 \n Microsoft Excel 2016 \n Microsoft Power Point 2016 \n Internet and E-mail \n Scanning and Printing", user_id: User.find_by(name: "Magway").id)
Course.create(name: "D.T.P Course", title: "D.T.P Course(Magway)", description: "Adobe PageMaker 7.0 \n Advanced Excel 2016", user_id: User.find_by(name: "Magway").id)
Course.create(name: "Advanced Excel 2016 Course", title: "Advanced Excel 2016 Course(Magway)", description: "Advanced Excel 2016", user_id: User.find_by(name: "Magway").id)

#dawei
Course.create(name: "Office 2016 Course", title: "Office 2016 Course(Dawei)", description: "Window's 10 \n Microsoft Word 2016 \n Microsoft Excel 2016  \n Microsoft Power Point 2016  \n Scanning and Printing", user_id: User.find_by(name: "Dawei").id)
Course.create(name: "D.T.P Course", title: "D.T.P Course(Dawei)", description: "Corel Draw X4   \n Adobe Photoshop C.S.3   \n Adobe PageMaker 7.0   \n Adobe Acrobat 7.0 \n Scanning and Printing", user_id: User.find_by(name: "Dawei").id)
Course.create(name: "Advanced Excel 2016 Course", title: "Advanced Excel 2016 Course(Dawei)", description: "Advanced Excel 2016", user_id: User.find_by(name: "Dawei").id)

#min hla
Course.create(name: "Office 2016 Course", title: "Office 2016 Course(Min Hla)", description: "Window's 10 \n Microsoft Word 2016  \n Microsoft Excel 2016    \n Microsoft Power Point 2016  \n Scanning and Printing", user_id: User.find_by(name: "Min Hla").id)

#Nattalin
Course.create(name: "Office 2016 Course", title: "Office 2016 Course(Nattalin)", description: "Window's 10 \n Microsoft Word 2016 \n Microsoft Excel 2016    \n Microsoft Power Point 2016  \n Scanning and Printing", user_id: User.find_by(name: "Nattalin").id)

#Pakokko
Course.create(name: "Office 2010 Course", title: "Office 2010 Course(Pakokko)", description: "Window's 7  \n Microsoft Word 2010 \n Microsoft Excel 2010    \n Microsoft Power Point 2010  \n Scanning and Printing", user_id: User.find_by(name: "Pakokku").id)

#Aung Lan
Course.create(name: "Office 2010 Course", title: "Office 2010 Course(Aung Lan)", description: "Window's 7  \n Microsoft Word 2010 \n Microsoft Excel 2010    \n Microsoft Power Point 2010  \n Scanning and Printing", user_id: User.find_by(name: "Aung Lan").id)
#Tamwe
Course.create(name: "Office 2010 Course", title: "Office 2010 Course(Tamwe)", description: "Window's 7  \n Microsoft Word 2010 \n Microsoft Excel 2010    \n Microsoft Power Point 2010  \n Scanning and Printing", user_id: User.find_by(name: "Tamwe").id)

#Thingunkyun
Course.create(name: "Office 2010 Course", title: "Office 2010 Course(Thingunkyun)", description: "Window's 7  \n Microsoft Word 2010 \n Microsoft Excel 2010    \n Microsoft Power Point 2010  \n Scanning and Printing", user_id: User.find_by(name: "Thingunkyun").id)

#Latha
Course.create(name: "Office 2016 Course", title: "Office 2016 Course(Latha)", description: "Window's 10 \n Microsoft Word 2016  \n Microsoft Excel 2016    \n Microsoft Power Point 2016  \n Scanning and Printing", user_id: User.find_by(name: "Latha").id)
Course.create(name: "D.T.P Course", title: "D.T.P Course(Latha)", description: "Corel Draw X4   \n Adobe Photoshop C.S.3   \n Adobe PageMaker 7.0 \n Adobe Acrobat 7.0   \n Scanning and Printing", user_id: User.find_by(name: "Latha").id)
Course.create(name: "Advanced Excel 2016 Course", title: "Advanced Excel 2016 Course(Latha)", description: "Advanced Excel 2016", user_id: User.find_by(name: "Latha").id)
Course.create(name: "Graphic Design Course", title: "Graphic Design Course(Latha)", description: " Adobe Illustrator C.S3  \n Adobe Photoshop C.S3    \n Animated Photo Creation \n Scanning and Printing", user_id: User.find_by(name: "Latha").id)
