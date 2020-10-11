package uz.lesson.models;

import java.util.Date;

public class Article {
    private int id;
    private String name;
    private String content;
    private int categoryId;
    private int seenCount;
    private boolean isPublished;
    private Date createdAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSeenCount() {
        return seenCount;
    }

    public void setSeenCount(int seenCount) {
        this.seenCount = seenCount;
    }

    public boolean isPublished() {
        return isPublished;
    }

    public void setPublished(boolean published) {
        isPublished = published;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Article(int id, String name, String content, int categoryId, int seenCount, boolean isPublished, Date createdAt) {
        this.id = id;
        this.name = name;
        this.content = content;
        this.categoryId = categoryId;
        this.seenCount = seenCount;
        this.isPublished = isPublished;
        this.createdAt = createdAt;
    }

    public Article() {
    }
}
