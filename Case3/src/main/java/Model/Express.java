package Model;

public class Express {
    private int id;
    private String name;

    public Express() {
    }
    public Express(int id){
        this.id = id;
    }

    public Express(String name) {
        this.name = name;
    }

    public Express(int id, String name) {
        this.id = id;
        this.name = name;
    }

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
}
