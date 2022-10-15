package com.lambdabuy.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbookType;

import com.lambdabuy.entity.Order;

public class OrderExcelExporter {
	private XSSFWorkbook workbook;
	private XSSFSheet sheet;
	private List<Order> listOrders;
	public void headerLine() {
		// TODO Auto-generated method stub
		sheet = workbook.createSheet("List of Orders");
		Row row= sheet.createRow(0);
		CellStyle cellstyle= workbook.createCellStyle();
		XSSFFont font= workbook.createFont();
		font.setBold(true);
		font.setFontHeight(16);
		cellstyle.setFont(font);
		createCell(row, 0,"OrderId",cellstyle);
		createCell(row, 1,"UserId",cellstyle);
		createCell(row, 2,"OrderDate",cellstyle);
		createCell(row, 3,"Phone number",cellstyle);
		createCell(row, 4,"Shipping Address",cellstyle);
		createCell(row, 5,"Amount",cellstyle);
		createCell(row, 6,"Description",cellstyle);
		createCell(row, 7,"Status",cellstyle);
		
		
	}
	public void createCell(Row row, int countColumn, Object value, CellStyle cellstyle) {
		// TODO Auto-generated method stub
		sheet.autoSizeColumn(countColumn);
		Cell cell = row.createCell(countColumn);
		if(value instanceof Integer) {
			cell.setCellValue((Integer) value);
		} else if(value instanceof Boolean) {
			cell.setCellValue((Boolean) value);
		}
		else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(cellstyle);
	}
	
	//create Data from database
	public void writeDataLines() {
		// TODO Auto-generated method stub
		int rowCount=1;
		CellStyle style=workbook.createCellStyle();
		XSSFFont font=workbook.createFont();
		font.setFontHeight(18);
		style.setFont(font);
		for(Order order: listOrders) {
			Row row= sheet.createRow(rowCount++);
			int countColumn = 0;
			createCell(row, countColumn++, order.getId(), style);
			createCell(row, countColumn++, order.getUser().getId(), style);
			createCell(row, countColumn++,order.getOrderDate(), style);
			createCell(row, countColumn++, order.getTelephone(), style);
			createCell(row, countColumn++, order.getAddress(), style);
			createCell(row, countColumn++, order.getAmount(), style);
			createCell(row, countColumn++, order.getDescription(), style);
			createCell(row, countColumn++, order.getStatus(), style);
		}

	}
	public OrderExcelExporter(List<Order>list) {
		// TODO Auto-generated method stub
		this.listOrders=list;
		workbook=new XSSFWorkbook();
	}
	public void exportData(HttpServletResponse response) throws IOException {
		//calling method headerLine
		headerLine();
		//calling method writedataline
		writeDataLines();
		
		ServletOutputStream outputstream = response.getOutputStream();
		workbook.write(outputstream);
		workbook.close();
		outputstream.close();
		
	}
}
