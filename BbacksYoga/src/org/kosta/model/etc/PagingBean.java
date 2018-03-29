package org.kosta.model.etc;

/**
 * ??΄μ§? μ²λ¦¬λ₯? ?? λΉμ¦??€ κ³μΈ΅? ?΄??€ PagingBean method κ΅¬ν?? getStartRowNumber()
 * getEndRowNumber()<br> getTotalPage()<br> getTotalPageGroup()<br>
 * getNowPageGroup()<br>getStartPageOfPageGroup()<br>
 * getEndPageOfPageGroup()<br> isPreviousPageGroup()<br>isNextPageGroup()
 * 
 * @author kosta
 *
 */
public class PagingBean {
 /**
  * ??¬ ??΄μ§?
  */
 private int nowPage = 1;
 /**
  * ??΄μ§??Ή κ²μλ¬Όμ
  */
 private int postCountPerPage = 5;
 /**
  * ??΄μ§? κ·Έλ£Ή?Ή ??΄μ§??
  */
 private int pageCountPerPageGroup = 4;
 /**
  * database? ???₯? μ΄κ²?λ¬Όμ
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
  * ??¬ ??΄μ§?λ²νΈ? ?΄?Ή?? ?? κ²μλ¬Όμ row numberλ₯? λ°ν hint : ?΄? ??΄μ§?? λ§μ?λ§? λ²νΈ + 1 ((??¬??΄μ§?-1)
  * * ??΄μ§??Ή κ²μλ¬Όμ) +1
  * 
  * @return
  */
 public int getStartRowNumber() {
  return ((nowPage - 1) * postCountPerPage) + 1;
 }

 /**
  * ??¬ ??΄μ§??? λ³΄μ¬μ€? κ²μλ¬? ?(row)? λ§μ?λ§? λ²νΈ
  * ??¬??΄μ§?*contentNumberPerPage λ§μ½ μ΄κ²?λ¬Όμλ³΄λ€<br>
  * ?°?°κ²°κ³Ό? λ²νΈκ°? ?΄ κ²½μ° μ΄κ²?λ¬Όμκ°? λ§μ?λ§? λ²νΈκ°? ??΄?Ό ??€ ex) μ΄κ²?λ¬Όμ 7 κ°? μ΄ν?΄μ§?? 2??΄μ§? : 1 2 3 4 5<br>
  * | 6 7 | 1page 2page ??¬??΄μ§?? 2??΄μ§??΄κ³? 2*5(??΄μ§??Ή κ²μλ¬Όμ) ? 10 ?΄κ³? ?€?  λ§μ?λ§? λ²νΈ 7?΄?€ -><br>
  * ?°?°κ²°κ³Όκ°? μ΄κ²?λ¬Όμλ³΄λ€ ?΄ κ²½μ° μ΄κ²?λ¬Όμκ°? λ§μ?λ§λ²?Έκ°? ??΄?Ό ?¨
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
  * μ΄? ??΄μ§? ?λ₯? return??€.<br>
  * 1. ? μ²? ?°?΄?°(κ²μλ¬?) % ? ??΄μ§?? λ³΄μ¬μ€? ?°?΄?° κ°μ <br>
  * => 0 ?΄λ©? ?? / κ°μ΄ μ΄? ??΄μ§? ?<br>
  * 2. ? μ²? ?°?΄?°(κ²μλ¬?) % ? ??΄μ§?? λ³΄μ¬μ€? ?°?΄?° κ°μ <br>
  * => 0λ³΄λ€ ?¬λ©? ?? / κ°μ +1? ? κ°μ΄ μ΄? ??΄μ§? ?<br>
  * κ²μλ¬Όμ 1 2 3 4 5 6 7 8 9 10 11 12<br>
  * 1??΄μ§? 1~5<br>
  * 2??΄μ§? 6~10<br>
  * 3??΄μ§? 11,12 <br>
  * ex) κ²μλ¬? 32 κ°? , ??΄μ§??Ή κ²μλ¬Όμ 5κ°?-> 7 ??΄μ§?
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
  * μ΄? ??΄μ§? κ·Έλ£Ή? ?λ₯? return??€.<br>
  * 1. μ΄? ??΄μ§?? % Page Group ?Ή Page ?. <br>
  * => 0 ?΄λ©? ?? / κ°μ΄ μ΄? ??΄μ§? ?<br>
  * 2. μ΄? ??΄μ§?? % Page Group ?Ή Page ?. <br>
  * => 0λ³΄λ€ ?¬λ©? ?? / κ°μ +1? ? κ°μ΄ μ΄? ??΄μ§? ?<br>
  * ex) μ΄? κ²μλ¬? ? 23 κ°? <br>
  * μ΄? ??΄μ§? ? μ΄? ??΄μ§? κ·Έλ£Ή? ? <br>
  * ??΄μ§? 1 2 3 4 5<br>
  * ??΄μ§?κ·Έλ£Ή 1234(1κ·Έλ£Ή) 5(2κ·Έλ£Ή)<br>
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
  * ??¬ ??΄μ§?κ°? ?? ??΄μ§? κ·Έλ£Ή λ²νΈ(λͺ? λ²μ§Έ ??΄μ§? κ·Έλ£Ή?Έμ§?) ? return ?? λ©μ? <br>
  * 1. ??¬ ??΄μ§? % Page Group ?Ή Page ? => 0 ?΄λ©? <br>
  * ?? / κ°μ΄ ??¬ ??΄μ§? κ·Έλ£Ή. <br>
  * 2. ??¬ ??΄μ§? % Page Group ?Ή Page ? => 0 ?¬λ©? <br>
  * ?? / κ°μ +1? ? κ°μ΄ ??¬ ??΄μ§? κ·Έλ£Ή<br>
  * ??΄μ§? 1 2 3 4 /5 6 7 8/ 9 10 1κ·Έλ£Ή 2κ·Έλ£Ή 3κ·Έλ£Ή
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
  * ??¬ ??΄μ§?κ°? ?? ??΄μ§? κ·Έλ£Ή? ?? ??΄μ§? λ²νΈλ₯? return ??€.<br>
  * Page Group ?΄ Page ?*(??¬ ??΄μ§? κ·Έλ£Ή -1) + 1? ? κ°μ΄ μ²? ??΄μ§??΄?€.<br>
  * (??΄μ§? κ·Έλ£Ή*??΄μ§? κ·Έλ£Ή κ°μ, κ·Έλ£Ή? λ§μ?λ§? λ²νΈ?΄λ―?λ‘?) <br>
  * ??΄μ§? κ·Έλ£Ή <br>
  * 1 2 3 4 -> 5 6 7 8 -> 9 10 <br>
  * 
  * @return
  */
 public int getStartPageOfPageGroup() {
  int num = this.pageCountPerPageGroup * (this.getNowPageGroup() - 1) + 1;
  return num;
 }

 /**
  * ??¬ ??΄μ§?κ°? ?? ??΄μ§? κ·Έλ£Ή? λ§μ?λ§? ??΄μ§? λ²νΈλ₯? return ??€.<br>
  * 1. ??¬ ??΄μ§? κ·Έλ£Ή * ??΄μ§? κ·Έλ£Ή κ°μ κ°? λ§μ?λ§? λ²νΈ?΄?€. <br>
  * 2. κ·? κ·Έλ£Ή? λ§μ?λ§? ??΄μ§? λ²νΈκ°? ? μ²? ??΄μ§?? λ§μ?λ§? ??΄μ§? λ²νΈλ³΄λ€ <br>
  * ?° κ²½μ°? ? μ²? ??΄μ§?? λ§μ?λ§? λ²νΈλ₯? return ??€.<br>
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
  * ?΄?  ??΄μ§? κ·Έλ£Ή?΄ ??μ§? μ²΄ν¬?? λ©μ? <br>
  * ??¬ ??΄μ§?κ°? ?? ??΄μ§? κ·Έλ£Ή?΄ 1λ³΄λ€ ?¬λ©? true<br>
  * ex ) ??΄μ§? 1 2 3 4 / 5 6 7 8 / 9 10 <br>
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
  * ?€? ??΄μ§? κ·Έλ£Ή?΄ ??μ§? μ²΄ν¬?? λ©μ? <br>
  * ??¬ ??΄μ§? κ·Έλ£Ή?΄ λ§μ?λ§? ??΄μ§? κ·Έλ£Ή(<br>
  * λ§μ?λ§? ??΄μ§? κ·Έλ£Ή == μ΄? ??΄μ§? κ·Έλ£Ή ?) λ³΄λ€ ??Όλ©? true<br>
  * * ex ) ??΄μ§? <br>
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
  // ???΄μ§?? ?? row number λ₯? μ‘°ν 46
  System.out.println("getBeginRowNumber:" + p.getStartRowNumber());
  // ???΄μ§?? λ§μ?λ§? row number λ₯? μ‘°ν 47
  System.out.println("getEndRowNumber:" + p.getEndRowNumber());
  // ? μ²? ??΄μ§? ? : 10
  System.out.println("getTotalPage:" + p.getTotalPage());
  // ? μ²? ??΄μ§? κ·Έλ£Ή ? : 3
  System.out.println("getTotalPageGroup:" + p.getTotalPageGroup());
  System.out.println("////////////////////////////");
  p = new PagingBean(31, 6);// κ²μλ¬Όμ 31 ??¬ ??΄μ§? 6
  // ???΄μ§?? ?? row number λ₯? μ‘°ν 26
  System.out.println("getStartRowNumber:" + p.getStartRowNumber());
  // ???΄μ§?? λ§μ?λ§? row number λ₯? μ‘°ν 30
  System.out.println("getEndRowNumber:" + p.getEndRowNumber());
  // κ²μλ¬Όμ 31 -> μ΄ν?΄μ§?? 7 -> μ΄ν?΄μ§?κ·Έλ£Ή->2
  // ??¬ ??΄μ§? κ·Έλ£Ή : 2
  System.out.println("getNowPageGroup:" + p.getNowPageGroup());
  // ??΄μ§? κ·Έλ£Ή? ?? ??΄μ§? : 5
  System.out.println("getStartPageOfPageGroup:" + p.getStartPageOfPageGroup());
  // ??΄μ§? κ·Έλ£Ή? λ§μ?λ§? ??΄μ§? : 7
  System.out.println("getEndPageOfPageGroup:" + p.getEndPageOfPageGroup());
  // ?΄?  ??΄μ§? κ·Έλ£Ή?΄ ?? μ§? : true
  System.out.println("isPreviousPageGroup:" + p.isPreviousPageGroup());
  // ?€? ??΄μ§? κ·Έλ£Ή?΄ ?? μ§? : false
  System.out.println("isNextPageGroup:" + p.isNextPageGroup());

 }

}
