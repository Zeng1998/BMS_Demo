package com.zxc.domain;

//相当于数据库的一张表
//模型层
public class Tb_Book {
    private String name;
    private String author;
    private String pub_time;
    private String type;
    private String id;

    public void setName(String name) {
        this.name = name;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPub_time(String pub_time) {
        this.pub_time = pub_time;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public String getPub_time() {
        return pub_time;
    }

    public String getType() {
        return type;
    }

    public String getId() {
        return id;
    }

}
