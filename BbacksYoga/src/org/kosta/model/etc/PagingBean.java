package org.kosta.model.etc;

/**
 * ?˜?´ì§? ì²˜ë¦¬ë¥? ?œ„?•œ ë¹„ì¦ˆ?‹ˆ?Š¤ ê³„ì¸µ?˜ ?´?˜?Š¤ PagingBean method êµ¬í˜„?ˆœ?„œ getStartRowNumber()
 * getEndRowNumber()<br> getTotalPage()<br> getTotalPageGroup()<br>
 * getNowPageGroup()<br>getStartPageOfPageGroup()<br>
 * getEndPageOfPageGroup()<br> isPreviousPageGroup()<br>isNextPageGroup()
 * 
 * @author kosta
 *
 */
public class PagingBean {
 /**
  * ?˜„?¬ ?˜?´ì§?
  */
 private int nowPage = 1;
 /**
  * ?˜?´ì§??‹¹ ê²Œì‹œë¬¼ìˆ˜
  */
 private int postCountPerPage = 5;
 /**
  * ?˜?´ì§? ê·¸ë£¹?‹¹ ?˜?´ì§??ˆ˜
  */
 private int pageCountPerPageGroup = 4;
 /**
  * database?— ???¥?œ ì´ê²Œ?‹œë¬¼ìˆ˜
  */
 private int totalPostCount;

 public PagingBean() {
 }

 public PagingBean(int totalPostCount) {
  this.totalPostCount = totalPostCount;
 }

 public PagingBean(int totalPostCount, int nowPage) {
  this.totalPostCount = totalPostCount;
  this.nowPage = nowPage;
 }

 public int getNowPage() {
  return nowPage;
 }

 /**
  * ?˜„?¬ ?˜?´ì§?ë²ˆí˜¸?— ?•´?‹¹?•˜?Š” ?‹œ?‘ ê²Œì‹œë¬¼ì˜ row numberë¥? ë°˜í™˜ hint : ?´? „?˜?´ì§??˜ ë§ˆì?ë§? ë²ˆí˜¸ + 1 ((?˜„?¬?˜?´ì§?-1)
  * * ?˜?´ì§??‹¹ ê²Œì‹œë¬¼ìˆ˜) +1
  * 
  * @return
  */
 public int getStartRowNumber() {
  return ((nowPage - 1) * postCountPerPage) + 1;
 }

 /**
  * ?˜„?¬ ?˜?´ì§??—?„œ ë³´ì—¬ì¤? ê²Œì‹œë¬? ?–‰(row)?˜ ë§ˆì?ë§? ë²ˆí˜¸
  * ?˜„?¬?˜?´ì§?*contentNumberPerPage ë§Œì•½ ì´ê²Œ?‹œë¬¼ìˆ˜ë³´ë‹¤<br>
  * ?—°?‚°ê²°ê³¼?˜ ë²ˆí˜¸ê°? ?´ ê²½ìš° ì´ê²Œ?‹œë¬¼ìˆ˜ê°? ë§ˆì?ë§? ë²ˆí˜¸ê°? ?˜?–´?•¼ ?•œ?‹¤ ex) ì´ê²Œ?‹œë¬¼ìˆ˜ 7 ê°? ì´í˜?´ì§??Š” 2?˜?´ì§? : 1 2 3 4 5<br>
  * | 6 7 | 1page 2page ?˜„?¬?˜?´ì§??Š” 2?˜?´ì§??´ê³? 2*5(?˜?´ì§??‹¹ ê²Œì‹œë¬¼ìˆ˜) ?Š” 10 ?´ê³? ?‹¤? œ ë§ˆì?ë§? ë²ˆí˜¸ 7?´?‹¤ -><br>
  * ?—°?‚°ê²°ê³¼ê°? ì´ê²Œ?‹œë¬¼ìˆ˜ë³´ë‹¤ ?´ ê²½ìš° ì´ê²Œ?‹œë¬¼ìˆ˜ê°? ë§ˆì?ë§‰ë²ˆ?˜¸ê°? ?˜?–´?•¼ ?•¨
  * 
  * @return
  */
 public int getEndRowNumber() {
  int endRowNumber = nowPage * postCountPerPage;
  if (totalPostCount < endRowNumber)
   endRowNumber = totalPostCount;
  return endRowNumber;
 }

 /**
  * ì´? ?˜?´ì§? ?ˆ˜ë¥? return?•œ?‹¤.<br>
  * 1. ? „ì²? ?°?´?„°(ê²Œì‹œë¬?) % ?•œ ?˜?´ì§??— ë³´ì—¬ì¤? ?°?´?„° ê°œìˆ˜ <br>
  * => 0 ?´ë©? ?‘˜?„ / ê°’ì´ ì´? ?˜?´ì§? ?ˆ˜<br>
  * 2. ? „ì²? ?°?´?„°(ê²Œì‹œë¬?) % ?•œ ?˜?´ì§??— ë³´ì—¬ì¤? ?°?´?„° ê°œìˆ˜ <br>
  * => 0ë³´ë‹¤ ?¬ë©? ?‘˜?„ / ê°’ì— +1?„ ?•œ ê°’ì´ ì´? ?˜?´ì§? ?ˆ˜<br>
  * ê²Œì‹œë¬¼ìˆ˜ 1 2 3 4 5 6 7 8 9 10 11 12<br>
  * 1?˜?´ì§? 1~5<br>
  * 2?˜?´ì§? 6~10<br>
  * 3?˜?´ì§? 11,12 <br>
  * ex) ê²Œì‹œë¬? 32 ê°? , ?˜?´ì§??‹¹ ê²Œì‹œë¬¼ìˆ˜ 5ê°?-> 7 ?˜?´ì§?
  * 
  * @return
  */
 private int getTotalPage() {
  int num = this.totalPostCount % this.postCountPerPage;
  int totalPage = 0;
  if (num == 0) {
   totalPage = this.totalPostCount / this.postCountPerPage;
  } else {
   totalPage = this.totalPostCount / this.postCountPerPage + 1;
  }
  return totalPage;
 }

 /**
  * ì´? ?˜?´ì§? ê·¸ë£¹?˜ ?ˆ˜ë¥? return?•œ?‹¤.<br>
  * 1. ì´? ?˜?´ì§??ˆ˜ % Page Group ?‹¹ Page ?ˆ˜. <br>
  * => 0 ?´ë©? ?‘˜?„ / ê°’ì´ ì´? ?˜?´ì§? ?ˆ˜<br>
  * 2. ì´? ?˜?´ì§??ˆ˜ % Page Group ?‹¹ Page ?ˆ˜. <br>
  * => 0ë³´ë‹¤ ?¬ë©? ?‘˜?„ / ê°’ì— +1?„ ?•œ ê°’ì´ ì´? ?˜?´ì§? ?ˆ˜<br>
  * ex) ì´? ê²Œì‹œë¬? ?ˆ˜ 23 ê°? <br>
  * ì´? ?˜?´ì§? ? ì´? ?˜?´ì§? ê·¸ë£¹?ˆ˜ ? <br>
  * ?˜?´ì§? 1 2 3 4 5<br>
  * ?˜?´ì§?ê·¸ë£¹ 1234(1ê·¸ë£¹) 5(2ê·¸ë£¹)<br>
  * 
  */
 private int getTotalPageGroup() {
  int num = this.getTotalPage() % this.pageCountPerPageGroup;
  int totalPageGroup = 0;
  if (num == 0) {
   totalPageGroup = this.getTotalPage() / this.pageCountPerPageGroup;
  } else {
   totalPageGroup = this.getTotalPage() / this.pageCountPerPageGroup + 1;
  }
  return totalPageGroup;
 }

 /**
  * ?˜„?¬ ?˜?´ì§?ê°? ?†?•œ ?˜?´ì§? ê·¸ë£¹ ë²ˆí˜¸(ëª? ë²ˆì§¸ ?˜?´ì§? ê·¸ë£¹?¸ì§?) ?„ return ?•˜?Š” ë©”ì†Œ?“œ <br>
  * 1. ?˜„?¬ ?˜?´ì§? % Page Group ?‹¹ Page ?ˆ˜ => 0 ?´ë©? <br>
  * ?‘˜?„ / ê°’ì´ ?˜„?¬ ?˜?´ì§? ê·¸ë£¹. <br>
  * 2. ?˜„?¬ ?˜?´ì§? % Page Group ?‹¹ Page ?ˆ˜ => 0 ?¬ë©? <br>
  * ?‘˜?„ / ê°’ì— +1?„ ?•œ ê°’ì´ ?˜„?¬ ?˜?´ì§? ê·¸ë£¹<br>
  * ?˜?´ì§? 1 2 3 4 /5 6 7 8/ 9 10 1ê·¸ë£¹ 2ê·¸ë£¹ 3ê·¸ë£¹
  * 
  * @return
  */
 private int getNowPageGroup() {
  int num = this.nowPage % this.pageCountPerPageGroup;
  int nowPageGroup = 0;
  if (num == 0) {
   nowPageGroup = this.nowPage / this.pageCountPerPageGroup;
  } else {
   nowPageGroup = this.nowPage / this.pageCountPerPageGroup + 1;
  }
  return nowPageGroup;
 }

 /**
  * ?˜„?¬ ?˜?´ì§?ê°? ?†?•œ ?˜?´ì§? ê·¸ë£¹?˜ ?‹œ?‘ ?˜?´ì§? ë²ˆí˜¸ë¥? return ?•œ?‹¤.<br>
  * Page Group ?‚´ Page ?ˆ˜*(?˜„?¬ ?˜?´ì§? ê·¸ë£¹ -1) + 1?„ ?•œ ê°’ì´ ì²? ?˜?´ì§??´?‹¤.<br>
  * (?˜?´ì§? ê·¸ë£¹*?˜?´ì§? ê·¸ë£¹ ê°œìˆ˜, ê·¸ë£¹?˜ ë§ˆì?ë§? ë²ˆí˜¸?´ë¯?ë¡?) <br>
  * ?˜?´ì§? ê·¸ë£¹ <br>
  * 1 2 3 4 -> 5 6 7 8 -> 9 10 <br>
  * 
  * @return
  */
 public int getStartPageOfPageGroup() {
  int num = this.pageCountPerPageGroup * (this.getNowPageGroup() - 1) + 1;
  return num;
 }

 /**
  * ?˜„?¬ ?˜?´ì§?ê°? ?†?•œ ?˜?´ì§? ê·¸ë£¹?˜ ë§ˆì?ë§? ?˜?´ì§? ë²ˆí˜¸ë¥? return ?•œ?‹¤.<br>
  * 1. ?˜„?¬ ?˜?´ì§? ê·¸ë£¹ * ?˜?´ì§? ê·¸ë£¹ ê°œìˆ˜ ê°? ë§ˆì?ë§? ë²ˆí˜¸?´?‹¤. <br>
  * 2. ê·? ê·¸ë£¹?˜ ë§ˆì?ë§? ?˜?´ì§? ë²ˆí˜¸ê°? ? „ì²? ?˜?´ì§??˜ ë§ˆì?ë§? ?˜?´ì§? ë²ˆí˜¸ë³´ë‹¤ <br>
  * ?° ê²½ìš°?Š” ? „ì²? ?˜?´ì§??˜ ë§ˆì?ë§? ë²ˆí˜¸ë¥? return ?•œ?‹¤.<br>
  * 1 2 3 4 -> 5 6 7 8 -> 9 10
  * 
  * @return
  */
 public int getEndPageOfPageGroup() {
  int num = this.getNowPageGroup() * this.pageCountPerPageGroup;
  if (this.getTotalPage() < num) {
   num = this.getTotalPage();
  }
  return num;
 }

 /**
  * ?´? „ ?˜?´ì§? ê·¸ë£¹?´ ?ˆ?Š”ì§? ì²´í¬?•˜?Š” ë©”ì„œ?“œ <br>
  * ?˜„?¬ ?˜?´ì§?ê°? ?†?•œ ?˜?´ì§? ê·¸ë£¹?´ 1ë³´ë‹¤ ?¬ë©? true<br>
  * ex ) ?˜?´ì§? 1 2 3 4 / 5 6 7 8 / 9 10 <br>
  * 1 2 3 group
  * 
  * @return
  */
 public boolean isPreviousPageGroup() {
  boolean flag = false;
  if (this.getNowPageGroup() > 1) {
   flag = true;
  }
  return flag;
 }

 /**
  * ?‹¤?Œ ?˜?´ì§? ê·¸ë£¹?´ ?ˆ?Š”ì§? ì²´í¬?•˜?Š” ë©”ì„œ?“œ <br>
  * ?˜„?¬ ?˜?´ì§? ê·¸ë£¹?´ ë§ˆì?ë§? ?˜?´ì§? ê·¸ë£¹(<br>
  * ë§ˆì?ë§? ?˜?´ì§? ê·¸ë£¹ == ì´? ?˜?´ì§? ê·¸ë£¹ ?ˆ˜) ë³´ë‹¤ ?‘?œ¼ë©? true<br>
  * * ex ) ?˜?´ì§? <br>
  * 1 2 3 4 / 5 6 7 8 / 9 10 <br>
  * 1 2 3 group
  * 
  * @return
  */
 public boolean isNextPageGroup() {
  boolean flag = false;
  if (this.getNowPageGroup() < this.getTotalPageGroup()) {
   flag = true;
  }
  return flag;
 }

 public static void main(String args[]) {
  PagingBean p = new PagingBean(47, 10);
  // ?˜„?˜?´ì§??˜ ?‹œ?‘ row number ë¥? ì¡°íšŒ 46
  System.out.println("getBeginRowNumber:" + p.getStartRowNumber());
  // ?˜„?˜?´ì§??˜ ë§ˆì?ë§? row number ë¥? ì¡°íšŒ 47
  System.out.println("getEndRowNumber:" + p.getEndRowNumber());
  // ? „ì²? ?˜?´ì§? ?ˆ˜ : 10
  System.out.println("getTotalPage:" + p.getTotalPage());
  // ? „ì²? ?˜?´ì§? ê·¸ë£¹ ?ˆ˜ : 3
  System.out.println("getTotalPageGroup:" + p.getTotalPageGroup());
  System.out.println("////////////////////////////");
  p = new PagingBean(31, 6);// ê²Œì‹œë¬¼ìˆ˜ 31 ?˜„?¬ ?˜?´ì§? 6
  // ?˜„?˜?´ì§??˜ ?‹œ?‘ row number ë¥? ì¡°íšŒ 26
  System.out.println("getStartRowNumber:" + p.getStartRowNumber());
  // ?˜„?˜?´ì§??˜ ë§ˆì?ë§? row number ë¥? ì¡°íšŒ 30
  System.out.println("getEndRowNumber:" + p.getEndRowNumber());
  // ê²Œì‹œë¬¼ìˆ˜ 31 -> ì´í˜?´ì§??ˆ˜ 7 -> ì´í˜?´ì§?ê·¸ë£¹->2
  // ?˜„?¬ ?˜?´ì§? ê·¸ë£¹ : 2
  System.out.println("getNowPageGroup:" + p.getNowPageGroup());
  // ?˜?´ì§? ê·¸ë£¹?˜ ?‹œ?‘ ?˜?´ì§? : 5
  System.out.println("getStartPageOfPageGroup:" + p.getStartPageOfPageGroup());
  // ?˜?´ì§? ê·¸ë£¹?˜ ë§ˆì?ë§? ?˜?´ì§? : 7
  System.out.println("getEndPageOfPageGroup:" + p.getEndPageOfPageGroup());
  // ?´? „ ?˜?´ì§? ê·¸ë£¹?´ ?ˆ?Š” ì§? : true
  System.out.println("isPreviousPageGroup:" + p.isPreviousPageGroup());
  // ?‹¤?Œ ?˜?´ì§? ê·¸ë£¹?´ ?ˆ?Š” ì§? : false
  System.out.println("isNextPageGroup:" + p.isNextPageGroup());

 }

}
