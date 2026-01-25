package beans;

import java.io.Serializable;
import java.sql.Timestamp;

public class MyData implements Serializable { 
	private int id;
	private String data;
	private Timestamp entryDatetime;
	private String color;
	// 追加機能：名前と文字色
	private String name;
	private String textColor;

	public MyData(){
	}

	public MyData(int id, String data, String color, Timestamp entryDatetime) {
		this.id = id;
		this.data = data;
		this.color = color;
		this.entryDatetime = entryDatetime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Timestamp getEntryDatetime() {
		return entryDatetime;
	}

	public void setEntryDatetime(Timestamp entryDatetime) {
		this.entryDatetime = entryDatetime;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	// --- 追加したGetter/Setter ---

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
}