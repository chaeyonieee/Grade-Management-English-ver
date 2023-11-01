package com.student.admin.vo;

import org.springframework.stereotype.Component;

@Component("gradeVO")
public class GradeVO {
	private int korean;
	private int english;
	private int math;
	private int koreanHistory;
	private int avg;
	private int sum;
	private int studentRank;
	private String id;

	public GradeVO() {}

	public int getKorean() {
		return korean;
	}

	public void setKorean(int korean) {
		this.korean = korean;
	}

	public int getEnglish() {
		return english;
	}

	public void setEnglish(int english) {
		this.english = english;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getKoreanHistory() {
		return koreanHistory;
	}

	public void setKoreanHistory(int koreanHistory) {
		this.koreanHistory = koreanHistory;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public int getStudentRank() {
		return studentRank;
	}

	public void setStudentRank(int studentRank) {
		this.studentRank = studentRank;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "GradeVO [korean=" + korean + ", english=" + english + ", math=" + math + ", koreanHistory="
				+ koreanHistory + ", avg=" + avg + ", sum=" + sum + ", studentRank=" + studentRank + ", id=" + id + "]";
	}
	
	
}
