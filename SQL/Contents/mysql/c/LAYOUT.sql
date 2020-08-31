create table LAYOUT
(
    id integer
        primary key auto_increment,
    name varchar(100) not null,
    description text default null,
    slug varchar(100) not null,
    title text default null
);

create unique index LAYOUT_slug_uindex
    on LAYOUT (slug);

