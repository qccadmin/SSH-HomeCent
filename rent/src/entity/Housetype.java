package entity;

public class Housetype {
     private int tid;  
     private int room;  // “
     private int hall;  //Ã¸
     private int toilet;//Œ¿
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getHall() {
		return hall;
	}
	public void setHall(int hall) {
		this.hall = hall;
	}
	public int getToilet() {
		return toilet;
	}
	public void setToilet(int toilet) {
		this.toilet = toilet;
	}
	public Housetype() {
		super();
	}
	public Housetype(int tid, int room, int hall, int toilet) {
		super();
		this.tid = tid;
		this.room = room;
		this.hall = hall;
		this.toilet = toilet;
	}
	@Override
	public String toString() {
		return "Housetype [tid=" + tid + ", room=" + room + ", hall=" + hall
				+ ", toilet=" + toilet + "]";
	}
	
     
}
