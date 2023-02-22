1. In the main playbook Dynamically add or remove the User_#Number & password_#number block lines depending on how much user you are going to add. 

2. Also Change the sudo_user_#Number Block lines depending on how much user you are going to add.

3. Depending on Number 1 & 2, Comment / Uncomment the import tasks lines and if you require to add more than 3 users then copy the #05-a-create_user1.yml and create 05-d/e/f-create_user4/5/6.yml and also add the Tasks sequentially after the using -import_tasks: Task_name

4. Now when you are final on specifying the users, corresponding passwords and sudo users block lines then now change the variable fields in the mentioned tasks files

	1. Create / Delete "User creation" files if more / less than 3 user
	2. Create / Delete "Add sudo user" files if more / less than 3 user
	3. 06-sshd_config.yml - AllowUsers section accordingly
	4. 12-welcome_info_msg - Add / Delete username_ variable section blocks
	5. Change the AllowUser name centos to rocky for this case	

Thats All for now. Happy Post Installation.
