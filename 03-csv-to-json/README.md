# CSV to JSON Converter (Perl)

A simple Perl script that converts CSV files into JSON format.

## Features

- Reads data from a CSV file
- Converts rows into JSON objects
- Saves the result into a JSON file
- Detects rows with missing columns

---

## Requirements

- Perl installed
- CPAN modules:
  - Text::CSV
  - JSON

Install dependencies:

```bash
cpanm Text::CSV JSON
```

Or:

```bash
cpan Text::CSV JSON
```

---

## Project Structure

```bash
csv-to-json/
│
├── data.csv
├── convert.pl
└── output.json
```

---

## Example CSV Input

`data.csv`

```csv
name,age,city
John,25,Cochabamba
Maria,30,La Paz
Carlos,22,Santa Cruz
```

---

## Run the Script

```bash
perl convert.pl
```

---

## Example JSON Output

`output.json`

```json
[
   {
      "name" : "John",
      "age" : "25",
      "city" : "Cochabamba"
   },
   {
      "name" : "Maria",
      "age" : "30",
      "city" : "La Paz"
   }
]
```

---

## Error Handling

If a row has missing columns, the script will skip it and show a warning message.

Example:

```bash
Invalid row found.
```

---

## Technologies Used

- Perl
- Text::CSV
- JSON

---