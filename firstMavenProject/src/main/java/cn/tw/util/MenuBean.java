package cn.tw.util;

import java.util.List;

public class MenuBean{
    private String id;
    private String pid;
    private String text;
    private String url;
    private List<MenuBean> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<MenuBean> getChildren() {
        return children;
    }

    public void setChildren(List<MenuBean> children) {
        this.children = children;
    }

    @Override
    public String toString() {
        return "MenuBean{" +
                "id='" + id + '\'' +
                ", pid='" + pid + '\'' +
                ", text='" + text + '\'' +
                ", url='" + url + '\'' +
                ", children=" + children +
                '}';
    }
}
