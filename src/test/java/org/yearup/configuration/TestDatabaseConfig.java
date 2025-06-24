package org.yearup.configuration;

import org.apache.ibatis.jdbc.ScriptRunner;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.sql.DataSource;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@Configuration
public class TestDatabaseConfig {

    @Value("${spring.datasource.url}")
    private String fullUrl;

    @Value("${spring.datasource.username}")
    private String username;

    @Value("${spring.datasource.password}")
    private String password;

    @PostConstruct
    public void setup() {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", username, password);
             Statement statement = connection.createStatement()) {
            statement.execute("DROP DATABASE IF EXISTS easyshop_test;");
            statement.execute("CREATE DATABASE easyshop_test;");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @PreDestroy
    public void cleanup() {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys", username, password);
             Statement statement = connection.createStatement()) {
            statement.execute("DROP DATABASE IF EXISTS easyshop_test;");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Bean
    public DataSource dataSource() throws Exception {
        String testUrl = "jdbc:mysql://localhost:3306/easyshop_test";

        SingleConnectionDataSource dataSource = new SingleConnectionDataSource();
        dataSource.setUrl(testUrl);
        dataSource.setUsername(username);
        dataSource.setPassword(password);
        dataSource.setAutoCommit(false);
        dataSource.setSuppressClose(true);

        try (Connection conn = dataSource.getConnection()) {
            ScriptRunner runner = new ScriptRunner(conn);
            Reader reader = new BufferedReader(new FileReader(new ClassPathResource("test-data.sql").getFile()));
            runner.runScript(reader);
            conn.commit();
        }

        return dataSource;
    }
}

