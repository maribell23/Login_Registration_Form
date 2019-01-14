/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.sql.DataSource;
import model.User;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import utility.BCrypt;

/**
 *
 * @author Bella
 */
public class UserDAO {

    private final DataSource dataSource;

    public UserDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public int insertUser(User u) {
        SimpleJdbcInsert simpleJdbcInsert = new SimpleJdbcInsert(dataSource).withTableName("users");
        Map<String, Object> parameters = new HashMap<String, Object>();
        String hashed_password = BCrypt.hashpw(u.getPassword(), BCrypt.gensalt());
        parameters.put("username", u.getUsername());
        parameters.put("password", hashed_password);
        parameters.put("email", u.getEmail());
        parameters.put("firstName", u.getFirstName());
        parameters.put("lastName", u.getLastName());
        return simpleJdbcInsert.execute(parameters);
    }

    public String getAllUsersByUsername(String username) {
        JdbcTemplate jdbcTemp = new JdbcTemplate(dataSource);
        String sql = "select * from users where username = '" + username + "'";
        return jdbcTemp.query(sql, new ResultSetExtractor<String>() {
            @Override
            public String extractData(ResultSet rs) throws SQLException, DataAccessException {
                return rs.next() ? rs.getString("username") : null;
            }
        });
    }

    public User findByUserUsername(String username) {
        JdbcTemplate jdbcTemp = new JdbcTemplate(dataSource);
        String sql = "SELECT * FROM users WHERE username = ?";
        try {
            User user = (User) jdbcTemp.queryForObject(
                sql, new Object[]{username},
                new BeanPropertyRowMapper(User.class));

            return user;
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
}
