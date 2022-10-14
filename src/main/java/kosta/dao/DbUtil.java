package kosta.dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
* DB연동을 위한 로드 연결 닫기
*   : DBCP기술 적용 (context.xml 참조)
* */
public class DbUtil {
    // ds를 getConnection에서 사용하기위해서
    private static DataSource ds;
    /*
    * 로드 : 한번만 생성함
    * */
    static {
        try {
        /*    Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            ds = (DataSource) envContext.lookup("jdbc/myoracle");*/

        // 위에걸 더 간단하게 하기
            Context initContext = new InitialContext();
            // lookup : 데이터를 찾는메서드,  java:/comp/env : 고정 , jdbc/myoracle : Context.xml에서 지정한이름
            // 결론 : (DataSource) initContext.lookup("java:/comp/env/jdbc/myoracle"); 이 데이터 소스는 커넥션을 관리하는 객체
            ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/myoracle");

        } catch (Exception e) {
            e.printStackTrace();
        }
    } // static 끝

    /*
    * 연결 : 필요할때마다 여러번 호출해서 사용함
    * */
    public static Connection getConnection() throws SQLException {
        // 이렇게 커넥션을 얻어오면 was쪽에서 확보해논 데이터 커넥션을 con에게 줌 그럼 그냥 그걸 리턴해서 이용만 해주면됨
        Connection con = ds.getConnection();
        return con;

    }

    /*
     * 닫기 - 사용된 객체 닫기 - selector 경우
     * */
    public static void dbClose(Connection con, Statement st, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
                dbClose(con, st);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void dbClose(Connection con, Statement st) {
        try {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*
    * 닫기 - 사용된 객체 닫기 - DML or DDl인 경우
    * */

}
