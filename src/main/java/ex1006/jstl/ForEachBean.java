package ex1006.jstl;

import ex1006.dto.BoardDTO;

import java.util.*;

public class ForEachBean {
    private String[] names = {"연아", "규연", "희진", "두영", "재덕"};

    private List<String> menus = Arrays.asList("짜장", "짬뽕", "짬짜면", "탕수육", "팔보채");

    private List<BoardDTO> boardList = new ArrayList<>();

    private Map<String, String> map = new HashMap<>();

    public ForEachBean() {
        System.out.println("ForEachBean 생성자...");
        boardList.add(new BoardDTO(1, "JSTL 학습중1"));
        boardList.add(new BoardDTO(2, "JSTL 학습중2"));
        boardList.add(new BoardDTO(3, "JSTL 학습중3"));
        boardList.add(new BoardDTO(4, "JSTL 학습중4"));
        boardList.add(new BoardDTO(5, "JSTL 학습중5"));
        boardList.add(new BoardDTO(6, "JSTL 학습중6"));
        boardList.add(new BoardDTO(7, "JSTL 학습중7"));
        boardList.add(new BoardDTO(8, "JSTL 학습중8"));
        boardList.add(new BoardDTO(9, "JSTL 학습중9"));
        boardList.add(new BoardDTO(10, "JSTL 학습중10"));
        boardList.add(new BoardDTO(11, "JSTL 학습중11"));

        map.put("kr", "대한민국");
        map.put("us", "미국");
        map.put("fr", "프랑스");
        map.put("jp", "일본");
        map.put("cn", "중국");
    }

    public String[] getNames() { // 뷰에서 get 메서드 호출할때 이름.get을 빼고 나머지 소문자로 ${이름.names}
        return names;
    }

    public List<String> getMenus() { // 뷰에서 get 메서드 호출할때 이름.get을 빼고 나머지 소문자로 ${이름.menus}
        return menus;
    }

    public List<BoardDTO> getBoardList() { // 뷰에서 get 메서드 호출할때 이름.get을 빼고 나머지 소문자로 ${이름.boardList}
        return boardList;
    }

    public Map<String, String> getMap() { // 뷰에서 get 메서드 호출할때 이름.get을 빼고 나머지 소문자로 ${이름.map}
        return map;
    }
}
