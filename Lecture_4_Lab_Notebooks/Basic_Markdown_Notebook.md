# Guillem Lab Notebook

- Project: Teaching 
- Date: 04/01/2024

## Moving files

- I need to move a file from /Downloads to /Documents.
- I will first do md5sum.

```
cd ~/Downloads

md5sum myfile.txt

```

- The md5sum in oirgin returned: 

66c603e9737f1132e57ebf4ca957ce8b myfile.txt

- I move the file and check again md5sum.

```
cp myfile.txt ~/Documents

cd ~/Documents

md5sum myfile.txt

```

- The md5sum at the destination returned: 

66c603e9737f1132e57ebf4ca957ce8b myfile.txt


- The md5sum matches, which means the transfer was done succesfully.
