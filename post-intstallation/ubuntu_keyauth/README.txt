1. In the main playbook Dynamically add or remove the task names depending on how much user you are going to add. 

2. Also Change the create_user_#Number & sudo_user_#Number Block lines depending on how much user you are going to add in the create_user and Sudo_user files


3. Now when you are final on specifying the users, corresponding passwords and sudo users block lines then now change the variable fields in the mentioned tasks files

	1. Create / Delete "User creation" blocks if more / less than 3 user
	2. Create / Delete variable blocks for create_user & sudo_users depending on user quantity if  more / less than 3 user
	3. 06-sshd_config.yml - AllowUsers section accordingly
	4. 12-welcome_info_msg - Add / Delete username_ variable section blocks
	5. Change the AllowUser name centos to rocky for this case	

Thats All for now. Happy Post Installation.
