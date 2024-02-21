

create table role(id int primary key, name varchar unique not null);

create table user_detail(id serial primary key, name varchar not null, email varchar unique not null, role_id int not null, created_at timestamp not null,
				 constraint fk_user_role_id foreign key(role_id) references role(id));
				 
create table task(id serial primary key, name varchar not null, description varchar not null, created_at timestamp not null,
				 created_by int not null, 
				 constraint fk_task_created_by foreign key(created_by) references user_detail(id));

create table task_allocation(id serial primary key, task_id int not null, developer_id int not null, assigned_by int not null,
							assigned_at timestamp not null, status varchar not null,
							constraint fk_task_allocation_task_id foreign key (task_id) references task(id),
							constraint fk_task_allocation_developer_id foreign key(developer_id) references user_detail(id),
							constraint fk_task_allocation_assigned_by foreign key(assigned_by) references user_detail(id),
							unique(task_id, developer_id));
							
create table hiring_status(id int primary key, status varchar not null unique);

create table candidate(id int primary key, name varchar not null, email varchar not null, interviewer_id int not null, 
				   status_id int not null, scheduled_at timestamp not null,
				   constraint fk_candidate_interviewer_id foreign key(interviewer_id) references user_detail(id),
				   constraint fk_candidate_status_id foreign key(status_id) references hiring_status(id));
				   
				   
				   
create table expense_type (id int primary key, type varchar not null unique);
create table expense_status (id int primary key, status varchar not null unique);

create table expense_detail (id serial primary key, user_id int not null, type_id  int not null, status_id int not null,
							 spent_at timestamp not null, amount double precision, description varchar not null,
							 accounted_at timestamp not null, accounted_by int, created_at timestamp not null,
							 constraint fk_expense_detail_user_id foreign key(user_id) references user_detail(id),
							 constraint fk_expense_detail_status_id foreign key(status_id) references expense_status(id),
							 constraint fk_expense_detail_type_id foreign key(type_id) references expense_type(id),
							 constraint fk_expense_detail_accounted_by foreign key(accounted_by) references user_detail(id)
							);
							
insert into role(id, name) values (1, 'Manager');
insert into role(id, name) values (2, 'Developer');
insert into role(id, name) values (3, 'Admin');
insert into role(id, name) values (4, 'Accountant');

insert into hiring_status(id, status) values (1, 'Waiting');
insert into hiring_status(id, status) values (2, 'Selected');
insert into hiring_status(id, status) values (3, 'On hold');
insert into hiring_status(id, status) values (4, 'Rejected');
insert into hiring_status(id, status) values (5, 'User created');

insert into expense_type(id, type) values (1, 'Holidays');
insert into expense_type(id, type) values (2, 'Team Lunch');
insert into expense_type(id, type) values (3, 'Travel');
insert into expense_type(id, type) values (4, 'Business');

insert into expense_status(id, status) values (1, 'Accepted');
insert into expense_status(id, status) values (2, 'Rejected');
insert into expense_status(id, status) values (3, 'Amount credited');

select * from user_detail;
select * from role;
select * from task;
select * from task_allocation;

insert into user_detail(name,email,role_id,created_at) values('luffy','luff@gmail.com',2,'2024-02-01 01:01:59');
insert into task(name,description,created_by,created_at) values ('Apple Vision Pro application ','test Apple application',3,'2024-02-01 01:01:05');
insert into task_allocation(task_id,developer_id,assigned_by,assigned_at,status) 
values (2,5,3,'2024-02-01 01:22:22','Incomplete');

update task_allocation set status='Incomplete' where id=5; 


