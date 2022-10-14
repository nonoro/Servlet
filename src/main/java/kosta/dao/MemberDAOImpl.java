package kosta.dao;

import kosta.dto.Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAOImpl implements MemberDAO {
    @Override
    public List<Member> selectAll() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Member> members = new ArrayList<>();
        String sql = "SELECT * FROM MEMBER";

        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Member member = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                members.add(member);
                System.out.println(members);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return members;
    }

    @Override
    public int insert(Member member) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "insert into member(id, pwd, name, age, phone, addr, join_date) values(?, ?, ?, ?, ?, ?, sysdate)";
        int result = 0;
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, member.getId());
            ps.setString(2, member.getPwd());
            ps.setString(3, member.getName());
            ps.setInt(4, member.getAge());
            ps.setString(5, member.getPhone());
            ps.setString(6, member.getAddr());

            result = ps.executeUpdate();

            System.out.println("insert 결과 : " + result);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public boolean duplicateById(String id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT id FROM member where id =?";
        boolean result = false;
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                result = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps, rs);
        }

        return result;
    }

    @Override
    public int delete(String id) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "DELETE FROM member where id = ?";
        int result = 0;
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps);
        }
        return result;
    }

    @Override
    public Member selectById(String id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM member where id = ?";
        Member member = null;
        try {
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            // ?가 있다면 ? 개수만큼 필요~
            ps.setString(1, id);
            ps.executeQuery();
            rs = ps.executeQuery();
            if (rs.next()) {
                member = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtil.dbClose(con, ps, rs);
        }

        return member;
    }

    @Override
    public List<Member> searchByKeyWord(String keyField, String keyWord) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Member> members = new ArrayList<>();
        String sql = "SELECT * FROM MEMBER WHERE ";

        try {
            switch (keyField) {
                case "id":
                    sql += "ID LIKE ?";
                    break;
                case "name":
                    sql += "name LIKE ?";
                    break;
                case "addr":
                    sql += "addr LIKE ?";
                    break;
            }
            System.out.println("sql = " + sql);
            con = DbUtil.getConnection();
            ps = con.prepareStatement(sql);
            // ? 가 있다면 개수만큼 setXxx()필요
            ps.setString(1, "%" + keyWord + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
               Member member = new Member(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7));
                members.add(member);
            }
        } catch (Exception e) {

        } finally {
            DbUtil.dbClose(con, ps, rs);
        }
        return members;
    }
}
