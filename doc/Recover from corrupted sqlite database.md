# Recover from corrupted sqlite database

## Intro
When opening a database we sometimes get the following error message : 
`Error: database disk image is malformed`

It means there was a problem during a write to the database (most likely a power cut).

## Recover
In order to recover the database, we must dump the database to a text file, edit it to cleanup the problem and read it once more to save it into a `.db` format.

### Dump
```
sqlite3 malformed.db
.mode insert
.output dumpfile.sql
.exit
```

### Edit
- Look for `ERROR` in the text file, remove the line.
- Remove `ROLLBACK` at the end
- Don't forget to add a `END TRANSACTION` if there was a `BEGIN TRANSACTION` at the start.

### Read and save
```
sqlite fixed.db
.read dumpfile.sql
```

