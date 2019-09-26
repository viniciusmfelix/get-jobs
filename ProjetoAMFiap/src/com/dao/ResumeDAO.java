package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.model.Resume;

public class ResumeDAO {
	private Connection connection;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	public ResumeDAO() {
		
	}
	
	public void createResume(Resume resume) {
		sql = "INSERT INTO resumeform VALUES (?,?,?,?,?)";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1,resume.getGoal());
			ps.setString(2, resume.getAcademic_training());
			ps.setString(3, resume.getProfessional_experience());
			ps.setString(4, resume.getLanguages());
			ps.setString(5, resume.getExtracurricular_courses());
			ps.execute();
		}catch(SQLException e) {
			System.out.println("Error creating new resume on Oracle\n" + e);
		}
	}
	
	public void updateResume(Resume resume) {
		
	}
}