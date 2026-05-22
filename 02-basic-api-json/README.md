# Mini Notes API

A simple REST API built with Perl and Dancer2 for managing notes.

## Features

- Get all notes
- Create new notes
- Update existing notes
- Delete notes
- JSON file persistence
- Simple REST architecture

## Technologies

- Perl
- Dancer2
- JSON

## Project Structure

```txt
mini-api/
│
├── app.pl
├── notes.json
└── README.md
```

## Installation

Install dependencies:

```bash
cpanm Dancer2 JSON
```

## Run the Application

```bash
perl app.pl
```

The server will start at:

```txt
http://localhost:3000
```

---

# API Endpoints

## Get all notes

```http
GET /notes
```

Example:

```bash
curl http://localhost:3000/notes
```

---

## Create a note

```http
POST /notes
```

Example:

```bash
curl -X POST http://localhost:3000/notes \
-H "Content-Type: application/json" \
-d '{"text":"Learn Perl"}'
```

---

## Update a note

```http
PUT /notes/:id
```

Example:

```bash
curl -X PUT http://localhost:3000/notes/1 \
-H "Content-Type: application/json" \
-d '{"text":"Updated note"}'
```

---

## Delete a note

```http
DELETE /notes/:id
```

Example:

```bash
curl -X DELETE http://localhost:3000/notes/1
```

---

# Notes

- Notes are stored in `notes.json`
- IDs are generated automatically
- Data persists after restarting the server

---