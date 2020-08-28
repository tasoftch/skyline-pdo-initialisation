create table COMPONENT_ITEM
(
    id integer primary key autoincrement,
    component integer not null,
    shorthand text default null,
    slug text not null,
    type integer,
    cross_origin text,
    integrity text,
    media text,
    local_file integer default 0
);


