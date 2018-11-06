package com.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;

public class BookDao extends DBOper{
	public List<Book> getAllBook(){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM books";
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setIsbn(rs.getString("isbn"));
			book.setBookName(rs.getString("bookName"));
			book.setPublisherID(rs.getInt("publisherID"));
			book.setPrice(rs.getDouble("price"));
			book.setCount(rs.getInt("count"));
			book.setPic(rs.getString("pic"));
			book.setDesciption(rs.getString("desciption"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//根据ISBN查找一本图书
	public Book getBookByIsbn(String isbn){
			Book book = null;
			String sql = "SELECT * FROM books WHERE isbn=?";
			try{
				ResultSet rs = this.executeQuery(sql, new String[] {isbn});
				if(rs.next()){
				book = new Book();
				book.setIsbn(rs.getString("isbn"));
				book.setBookName(rs.getString("bookName"));
				book.setPublisherID(rs.getInt("publisherID"));
				book.setPrice(rs.getDouble("price"));
				book.setCount(rs.getInt("count"));
				book.setPic(rs.getString("pic"));
				book.setDesciption(rs.getString("desciption"));
				}
				}catch(SQLException e){
					e.printStackTrace();
				}finally{
					this.closeAll();
				}
			return book;
		}
	//根据书名查找图书列表
	public List<Book> getBookByName(String name){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM books WHERE bookName LIKE '%"+name+"%'";
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setIsbn(rs.getString("isbn"));
			book.setBookName(rs.getString("bookName"));
			book.setPublisherID(rs.getInt("publisherID"));
			book.setPrice(rs.getDouble("price"));
			book.setCount(rs.getInt("count"));
			book.setPic(rs.getString("pic"));
			book.setDesciption(rs.getString("desciption"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//根据出版社ID查找图书列表
	public List<Book> getBookByPublisher(int pid){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM books WHERE publisherID="+pid;
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setIsbn(rs.getString("isbn"));
			book.setBookName(rs.getString("bookName"));
			book.setPublisherID(rs.getInt("publisherID"));
			book.setPrice(rs.getDouble("price"));
			book.setCount(rs.getInt("count"));
			book.setPic(rs.getString("pic"));
			book.setDesciption(rs.getString("desciption"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//根据书名和出版色查找图书
	public List<Book> getBookByNameAndPubliser(String name,int pid){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM books WHERE bookName LIKE '%"+name+"%' And publisherID"+pid;
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setIsbn(rs.getString("isbn"));
			book.setBookName(rs.getString("bookName"));
			book.setPublisherID(rs.getInt("publisherID"));
			book.setPrice(rs.getDouble("price"));
			book.setCount(rs.getInt("count"));
			book.setPic(rs.getString("pic"));
			book.setDesciption(rs.getString("desciption"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//添加图书
	public boolean addBook(Book book){
		boolean r = false;
		try{
			String sql = "INSERT INTO books(isbn,bookName,publisherID,price,count,pic,description) VALUES(?,?,?,?,?,?,?)";
			int rs = this.executeUpdate(sql, new String[]{book.getIsbn(),book.getBookName(),""+book.getPublisherID(),""+book.getPrice(),""+book.getCount(),book.getPic(),book.getDesciption()});
			if(rs>0){
				//插入成功
				r = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return r;
	}
	//修改图书
	public boolean editBook(Book book){
		boolean r = false;
		try{
			String sql = "UPDATE books SET bookNam?,publisherID=?,price=?,count=?,pic=?,description=? WHERE isbn=?";
			int rs = this.executeUpdate(sql, new String[]{book.getBookName(),""+book.getPublisherID(),""+book.getPrice(),""+book.getCount(),book.getPic(),book.getDesciption(),book.getIsbn()});
			if(rs>0){
				//修改成功
				r = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return r;
	}
	//删除制定ISBN的图书
	public boolean delBookByIsbn(String isbn){
		boolean r = false;
		try{
			String sql = "DELETE FROM books WHERE isbn=?";
			int rs = this.executeUpdate(sql, new String[]{isbn});
			if(rs>0){
				//修改成功
				r = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return r;
	}
}
