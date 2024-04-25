
### Overview :sparkles:
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)&nbsp;
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white) ![Django](https://img.shields.io/badge/Django-092E20?style=for-the-badge&logo=django&logoColor=white) [HiveDB](https://github.com/hivedb)

● Emotion-analyzing journal mobile app with Speech-To-Text analysis using BERT ML model to analyze journal entry emotion

● Highly graphical and chart-heavy dashboard representing time and date based analysis of journal entries using Flutter/Dart

● Cohesive backend RESTful API built in Python with Django providing CRUD operations tied to a non-relational HIVE database

● Utilizes OpenAI’s Whisper/ChatGPT for calculating the emotion id which is send to frontend


Presentation
- https://docs.google.com/presentation/d/1rDxEwDhC16h3SyqXu0pTTeUneiPniajZnS6LJzaEl1E/edit?usp=sharing

## Development :computer:

### Requirements
- [Flutter](https://docs.flutter.dev/get-started/install)
- [Python3](https://www.python.org/downloads/)

### API Server Setup
1. Install requirements
```sh
cd api
pip install -r requirements.txt
```

2. Create `.env` file in the `/api` directory and place the necessary secrets in it (can be found in Notion).

### Run Django Server
```sh
python manage.py runserver
```
### Run Background Tasks
```sh
python manage.py process_tasks
```
