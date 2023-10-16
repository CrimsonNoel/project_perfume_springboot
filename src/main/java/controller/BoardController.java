package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import model.Board;
import model.BoardComment;
import model.Member;
import service.BoardMybatis;
import service.MemberMybatis;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	BoardMybatis bd;
	@Autowired
	MemberMybatis md;

	Model m;
	HttpSession session;
	HttpServletRequest request;

	// 초기화 작업을 한다, 객체 초기화 시에 사용한다.
	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		session = request.getSession();
	}

	// 게시글 작성 페이지
	@RequestMapping("boardForm")
	public String boardForm() {
		String id = (String) session.getAttribute("id");

		Member member = md.oneMember(id);

		m.addAttribute("member", member);
		return "board/boardForm";
	} // boardForm End

	// 게시글 업로드
	@RequestMapping("boardPro")
	public String boardPro(@RequestParam("f") MultipartFile multipartFile, Board board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board/images/"; // 사진 파일 경로
		String msg = "게시물 등록에 실패하였습니다.";
		String url = "/board/boardForm";

		String id = (String) session.getAttribute("id");
		String filename = " ";

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		board.setName(id);
		board.setImage(filename);
		System.out.println(board);
		int num = bd.insertBoard(board);

		if (num > 0) {
			msg = "게시물이 등록되었습니다.";
			url = "/board/boardList?pageNum=1";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // boardList End

	// 게시글 목록
	@RequestMapping("boardList")
	public String boardList() {
		// boardid가 파라미터로 넘어 왔을 때만 session에 저장
		if (request.getParameter("boardid") != null) /* */ {
			session.setAttribute("boardid", request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
		}
		String boardid = (String) session.getAttribute("boardid");
		if (boardid == null)
			boardid = "1";

		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1"; // 넘겨받은 pageNum이 없으면 1페이지로

		int limit = 5; // 한 page 당 게시물 갯수
		int pageInt = Integer.parseInt(pageNum); // page 번호

		int boardCount = bd.boardCount(boardid); // 전체 게시물 갯수
		int boardNum = boardCount - ((pageInt - 1) * limit);

		List<Board> list = bd.boardList(pageInt, limit, boardid);

		String boardName = "";
		switch (boardid) {
		case "1":
			boardName = "공지사항";
			break;
		case "2":
			boardName = "이벤트";
			break;
		}

		int bottomLine = 5;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		// (pageInt-1) / bottomLine -> 1, 2, 3일 때는 0이므로 (pageInt-1) / bottomLine *
		// bottomLine + 1 -> 1
		// (pageInt-1) / bottomLine -> 1, 2, 3일 때는 1이므로 (pageInt-1) / bottomLine *
		// bottomLine + 1 -> 4
		int end = start + bottomLine - 1;
		// start가 1이면 end가 3, start가 4면 end가 6 ...
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;

		// 게시글 num list
		List<Integer> boardNumLi = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			int boardNum2 = list.get(i).getNum();
			boardNumLi.add(boardNum2);
		}

		// 게시글 이름 list (게시글 작성자에 id 대신 닉네임을 뜨게 하기 위해)
		List<String> boardNameLi = new ArrayList<String>();
		for (int i = 0; i < boardNumLi.size(); i++) {
			int boardNum2 = boardNumLi.get(i);
			String Id2 = bd.boardOne(boardNum2).getName();
			String Name2 = md.oneMember(Id2).getName();
			boardNameLi.add(Name2);
		}

		m.addAttribute("boardNameLi", boardNameLi);
		m.addAttribute("list", list);
		m.addAttribute("boardNum", boardNum);
		m.addAttribute("boardName", boardName);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("maxPage", maxPage);

		return "board/boardList"; // view/board/boardList.jsp
	} // boardList End

	// 게시글 수정 페이지
	@RequestMapping("boardUpdateForm")
	public String boardUpdateForm(@RequestParam("num") int num) {

		String boardid = (String) request.getSession().getAttribute("boardid");
		if (boardid == null)
			boardid = "1";

		String boardName = "";
		switch (boardid) {
		case "1":
			boardName = "공지사항";
			break;
		case "2":
			boardName = "이벤트";
			break;
		}

		Board board = bd.boardOne(num);

		m.addAttribute("boardName", boardName);
		m.addAttribute("board", board);
		return "board/boardUpdateForm";
	} // boardUpdateForm End

	// 게시글 수정
	@RequestMapping("boardUpdatePro")
	public String boardUpdatePro(@RequestParam("f") MultipartFile multipartFile, @RequestParam("num") int boardNum,
			Board board) {
		String path = request.getServletContext().getRealPath("/") + "WEB-INF/view/board/images/";
		String msg = "";
		String url = "";
		String filename = bd.boardOne(boardNum).getImage();

		if (!multipartFile.isEmpty()) {
			File file = new File(path, multipartFile.getOriginalFilename());
			filename = multipartFile.getOriginalFilename();
			try {
				multipartFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		board.setImage(filename);

		if (bd.boardUpdate(board) > 0) /* Update OK */ {
			msg = "수정을 완료했습니다.";
			url = "/board/boardComment?num=" + board.getNum(); // 해당 게시물로 이동
		} else { // update fail
			msg = "수정을 실패했습니다.";
			url = "board/boardUpdateForm?num=" + board.getNum(); // 해당 게시물의 UpdateForm으로 이동
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert"; // view/board/alert.jsp 이동
	} // boardUpdatePro End

	// 게시글 삭제 페이지
	@RequestMapping("boardDeleteForm")
	public String boardDeleteForm(@RequestParam("num") int num) {

		m.addAttribute("num", num);
		return "board/boardDeleteForm";
	} // boardDeleteForm End

	// 게시글 삭제
	@RequestMapping("boardDeletePro")
	public String boardDeletePro(@RequestParam("num") int num) {
		String msg = "";
		String url = "";
		if (bd.boardDelete(num) > 0) {
			msg = "게시글이 삭제 되었습니다.";
			url = "/board/boardList";
		} else {
			msg = "삭제가 되지 않았습니다.";
			url = "/board/boardComment?num=" + num;
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // boardDeletePro End

	// 게시글 페이지 (댓글 포함)
	@RequestMapping("boardComment")
	public String boardComment(@RequestParam("num") int boardnum, HttpServletResponse response) {

		Board board = bd.boardOne(boardnum);
		List<BoardComment> commentLi = bd.commentList(boardnum);

		String id = board.getName();
		String name = md.oneMember(id).getName();

		// 조회수 관련 로직 추가
		String loginId = (String) session.getAttribute("id");
		Cookie cookie = null;
		Cookie[] cookies = request.getCookies();

		if (!id.equals(loginId)) {
			if (cookies != null && cookies.length > 0) { // 기존 쿠키가 있을 경우
				for (Cookie c : cookies) {
					if (c.getName().equals("readBoard")) { // "readBoard" 쿠키를 가지고 있을 경우
						cookie = c; // cookie에 쿠키 추가
					}
				}
			}

			int result = 0;

			if (cookie == null) { // "readBoard" 쿠키가 없을 경우
				cookie = new Cookie("readBoard", boardnum + "");
				result = bd.readCntUpdate(boardnum);
			} else { // "readBoard" 쿠키가 있을 경우
				String[] temp = cookie.getValue().split("/");
				List<String> list = Arrays.asList(temp);
				if (list.indexOf(boardnum + "") == -1) { // 기존 값에 같은 글번호가 없다면 추가
					cookie.setValue(cookie.getValue() + "/" + boardnum);
					result = bd.readCntUpdate(boardnum);
				}
			}
			if (result > 0) {
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(60 * 60 * 24); // 쿠키 지속시간 = 24시간
				response.addCookie(cookie);
			}
		}

		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		int pageInt = 0;
		if (pageNum == "0" || pageNum == null) {
			pageInt = 1;
		} else {
			pageInt = Integer.parseInt(pageNum); // page 번호
		}

		m.addAttribute("pageInt", pageInt);
		m.addAttribute("name", name);
		m.addAttribute("commentLi", commentLi);
		m.addAttribute("board", board);
		return "board/boardComment";
	} // boardComment End

	// 댓글 업로드
	@RequestMapping("boardCommentPro")
	public String boardCommentPro(@RequestParam("num") int boardnum) {
		String id = (String) session.getAttribute("id");
		String name = md.oneMember(id).getName();
		String comment = request.getParameter("comment");
		int num = bd.insertComment(comment, id, name, boardnum);

		if (num == 0)
			comment = "저장되지 않았습니다.";

		BoardComment c = new BoardComment();
		c.setContent(comment);
		c.setRegdate(new Date());

		m.addAttribute("c", c);

		return "board/boardCommentPro";
	} // boardCommentPro End

	// 댓글 삭제 페이지
	@RequestMapping("boardCommentDeleteForm")
	public String boardCommentDeleteForm(@RequestParam("ser") int ser) {

		BoardComment bc = bd.commentOne(ser);
		int num = bc.getNum();

		m.addAttribute("num", num);
		m.addAttribute("ser", ser);
		return "board/boardCommentDeleteForm";
	}

	// 댓글 삭제
	@RequestMapping("boardCommentDeletePro")
	public String boardCommentDeletePro(@RequestParam("ser") int ser) {
		String id = (String) session.getAttribute("id");

		BoardComment bc = bd.commentOne(ser);
		String msg = "";
		String url = "";

		int num = bc.getNum();
		Board b = bd.boardOne(num);
		int num2 = b.getNum(); // 댓글을 삭제하면 num만으로 해당 게시글로 돌아갈 수 없음.

		// 세션의 ID와 다르거나 admin 계정이 아니면 댓글 삭제 불가
		if (id.equals(bc.getId()) || id.equals("admin")) {
			if (bd.commentDelete(ser) > 0) {
				msg = "댓글이 삭제 되었습니다.";
				url = "/board/boardComment?num=" + num2;
			} else {
				msg = "오류 발생";
				url = "/board/boardComment?num=" + num2;
			}
		} else {
			msg = "해당 댓글을 작성한 회원만 삭제할 수 있습니다.";
			url = "/board/boardComment?num=" + num2;
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // boardDeletePro End

	// 로그인 한 유저가 자신이 쓴 댓글을 볼 수 있는 페이지
	@RequestMapping("myComment")
	public String myComment() {

		String id = (String) session.getAttribute("id");
		List<BoardComment> coname = new ArrayList<BoardComment>();
		coname = bd.commentName(id);

		// myComment.jsp에서[게시글목록]버튼
		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		int pageInt = Integer.parseInt(pageNum); // page 번호

		m.addAttribute("pageInt", pageInt);
		m.addAttribute("coname", coname);

		return "board/myComment";
	} // myComment End

	// myComment 페이지에서 선택한 댓글 삭제
	@RequestMapping("checkCommentDelete")
	public String checkCommentDelete() {

		String[] chk = request.getParameterValues("chk");

		String msg = "";
		String url = "";

		if (chk == null) {
			msg = "선택된 댓글이 없습니다";
			url = "/board/boardList";
		} else if (chk != null || chk.length > 0) {
			for (int i = 0; i < chk.length; i++) {
				int value = Integer.parseInt(chk[i]);
				System.out.println(value);

				bd.commentDelete(value);

				msg = "삭제가 완료되었습니다.";
				url = "/board/boardList";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "alert";
	} // checkCommentDelete

	// 전체 댓글 관리 페이지
	@RequestMapping("commentManagement")
	public String commentManagement() {

		if (request.getParameter("pageNum") != null) /* pageNum을 넘겨 받음 */ {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}
		String pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1"; // 넘겨받은 pageNum이 없으면 1페이지로

		int limit = 10; // 한 page 당 게시물 갯수
		int pageInt = Integer.parseInt(pageNum); // page 번호

		int boardCount = bd.commentCountAdmin(); // 전체 게시물 갯수
		int boardNum = boardCount - ((pageInt - 1) * limit);

		int bottomLine = 10;
		int start = (pageInt - 1) / bottomLine * bottomLine + 1;
		int end = start + bottomLine - 1;
		int maxPage = (boardCount / limit) + (boardCount % limit == 0 ? 0 : 1);
		if (end > maxPage)
			end = maxPage;

		List<BoardComment> adminComment = bd.commentListAdmin(pageInt, limit);
		int boardnum = 0;
		List subjectList = new ArrayList();
		for (int i = 0; i < adminComment.size(); i++) {
			boardnum = adminComment.get(i).getNum();
			Board board = bd.boardOne(boardnum);
			String subject = board.getSubject();
			subjectList.add(subject);
		}

		m.addAttribute("pageInt", pageInt);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("maxPage", maxPage);
		m.addAttribute("subjectList", subjectList);
		m.addAttribute("adminComment", adminComment);
		return "board/commentManagement";

	} // commentManagement End

} // BoardController End