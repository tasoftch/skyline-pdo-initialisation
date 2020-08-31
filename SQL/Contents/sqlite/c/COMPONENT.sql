create table COMPONENT
(
    id integer primary key autoincrement,
    name text not null,
    description text null,
    internal integer default 0,
    modified integer default 0
);



