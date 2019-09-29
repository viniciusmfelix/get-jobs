package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnection.ConnectToOracle;
import com.model.Resume;

public class ResumeDAO {
	private Connection connection;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	public ResumeDAO() {
		this.connection = new ConnectToOracle().connect();
	}
	
	public void createResume(Resume resume, String email) {
		sql = "INSERT INTO resumeform VALUES (?,?,?,?,?,?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1,resume.getGoal());
			ps.setString(2, resume.getAcademic_training());
			ps.setString(3, resume.getProfessional_experience());
			ps.setString(4, resume.getLanguages());
			ps.setString(5, resume.getExtracurricular_courses());
			ps.setString(6, email);
			ps.execute();
		}catch(SQLException e) {
			System.out.println("Error creating new resume on Oracle\n" + e);
		}
	}
	
	public void updateResume(Resume resume, String email) {
		sql = "UPDATE resumeform SET resumeform.goal = ?, resumeform.academic_training = ?, resumeform.professional_experience = ?, resumeform.languages = ?, resumeform.extracurrilar_courses = ? WHERE resumeform.email_user = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, resume.getGoal());
			ps.setString(2, resume.getAcademic_training());
			ps.setString(3, resume.getProfessional_experience());
			ps.setString(4, resume.getLanguages());
			ps.setString(5, resume.getExtracurricular_courses());
			ps.setString(6, email);
			ps.execute();
		}catch(SQLException e) {
			System.out.println("Error updating resume on Oracle\n" + e);
		}
	}
	
	public List<Resume> retrieveUserResume(String email){
		List<Resume> resumes = new ArrayList<>();
		sql = "SELECT * FROM resumeform WHERE email_user = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				resumes.add(new Resume(rs.getString("goal"),rs.getString("academic_training"),rs.getString("professional_experience"),rs.getString("languages"),rs.getString("extracurricular_courses")));
			}
		}catch(SQLException e) {
			System.out.println("Error retrieving user resume on Oracle\n" + e);
		}
		return resumes;
	}

	public boolean resumeExists(String email) {
		boolean exists = false;
		sql = "SELECT * FROM resumeform WHERE resumeform.email_user = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if(rs.next()) {
				exists = true;
			}
		}catch(SQLException e) {
			System.out.println("Error during check if resumeform exists on Oracle\n" + e);
		}
		return exists;
	}
}
