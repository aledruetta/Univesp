from flask_cors import CORS
from flask import Flask, jsonify, request

from .entities.entity import Session, engine, Base
from .entities.exam import Exam, ExamSchema

app = Flask(__name__)

CORS(app)

Base.metadata.create_all(engine)

@app.route('/exams')
def get_exams():
    session = Session()
    exam_objects = session.query(Exam).all()
    schema = ExamSchema(many=True)
    exams = schema.dump(exam_objects)
    session.close()

    return jsonify(exams)

# if len(exams) == 0:
#     python_exam = Exam("SQLAlchemy Exam", "Test your knowledge about SQLAlchemy.", "script")
#     session.add(python_exam)
#     session.commit()
#     session.close()
# 
#     exams = session.query(Exam).all()
#  
# print("### Exams:")
# 
# for exam in exams:
#     print(f'({exam.id}) {exam.title} - {exam.description}')