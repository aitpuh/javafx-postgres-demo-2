import java.sql.Timestamp;
import java.util.List;

public class Task {
    public int getTask_id() {
        return task_id;
    }

    public void setTask_id(int task_id) {
        this.task_id = task_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getDuedate() {
        return duedate;
    }

    public void setDuedate(Timestamp duedate) {
        this.duedate = duedate;
    }

    public boolean isComplete() {
        return complete;
    }

    public void setComplete(boolean complete) {
        this.complete = complete;
    }

    private int task_id;
    String description;
    private Timestamp duedate;
    private boolean complete;
    List<User> users;

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Task{" +
                "task_id=" + task_id +
                ", description='" + description + '\'' +
                ", duedate=" + duedate +
                ", complete=" + complete +
                ", users=" + users +
                '}';
    }
}
