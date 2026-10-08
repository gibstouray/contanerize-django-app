if you look at the Dockerfile file, at the end you will see this line:

- CMD ["python" , "manage.py", "runserver", "0.0.0.0:8084"]

This line starts the server. However, at times, you might want to run multiple things. 
Repeating CMD after CMD isn't good practice. 

To resolve this, you will have to use an entrypoint file. you will create a file called entrypoint.sh

Here is an entry point file:

	#!/bin/sh
	
	echo "Running migrations..."
	python manage.py migrate

	echo "Starting server..."
	python manage.py runserver 0.0.0.0:8084


Then you make this file executable and now use it in teh CME line of the Dockerfile file

CMD ["./entrypoint.sh"]

Note that the entrypoint file has to be in the same directory with the Dockerfile file.


This is important. Lets asume you work in a team. You pull a code another developer has put on github. They've made
some changes and you want those changes to be migrated locally when you start up the docker compose process. 

Having  

#python manage.py migrate 

in the entrypoint file will allow you to do this.

