package org.yearup.data.mysql;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * Abstract base class for MySQL DAO classes.
 * Provides a protected method for getting a database connection from the injected DataSource.
 * Concrete DAOs extend this class for code reuse and consistency.
 */
public abstract class MySqlDaoBase
{
    protected DataSource dataSource;

    /**
     * Constructor to set the DataSource.
     * @param dataSource The DataSource to use for DB connections.
     */
    public MySqlDaoBase(DataSource dataSource)
    {
        this.dataSource = dataSource;
    }

    /**
     * Gets a new Connection from the DataSource.
     * @return A new Connection.
     * @throws SQLException If a DB error occurs.
     */
    protected Connection getConnection() throws SQLException
    {
        return dataSource.getConnection();
    }
}
