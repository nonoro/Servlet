package kosta.dao;

import kosta.dto.Member;

import java.util.List;

public interface MemberDAO {
    /*
     * 전체검색
     * SELECT * FROM MEMBER ORDER BY JOIN_DATE DESC;
     * */
    List<Member> selectAll();

    /*
     * 등록하기
     * insert into member(id, pwd, name, age, phone, addr, join_date) values(?, ?, ?, ?, ?, ?, sysdate);
     * */
    int insert(Member member);

    /*
     * ID 중복체크
     * @return : true이면 중복, false이면 중복아님
     * select id from member where id=?
     * select id from member where id='jang' 값이 있는경우 rs.next가 true : 값이 있다 중복!!!
     * select id from member where id='aa' 값이 없는경우 rs.next가 false : 값이 없다 중복아니다!!!!
     * */
    boolean duplicateById(String id);


    /*
     * 삭제하기
     * DELETE FROM MEMBER WHERE ID=?
     * */
    int delete(String id);

    /*
     * 상세보기
     * SELECT * FROM MEMBER WHERE ID=?
     * */
    Member selectById(String id);

    /*
     * 조건검색
     * (검색필드와 검색단어를 전달받아 검색필드에 검색단어를 포함한 레고드 검색)

     * SELECT * FROM MEMBER WHERE ID LIKE '%J%';
     * SELECT * FROM MEMBER WHERE 검색필드 LIKE 검색단어;

     * SELECT * FROM MEMBER WHERE ID LIKE ?;
     * SELECT * FROM MEMBER WHERE NAME LIKE ?;
     * SELECT * FROM MEMBER WHERE ADDR LIKE ?;
     * */
    List<Member> searchByKeyWord(String keyField, String keyWord);
}
