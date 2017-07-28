import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.io.PrintWriter;

public class PdfServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws IOException {
        //PrintWriter out = response.getWriter();
        response.setContentType("application/pdf");

        response.setHeader("Content-disposition", "inline; filename='Vehicle_service.pdf'");
        Document document = new Document();
        HttpSession session = request.getSession(false);

        if (session!= null) {
            String regno = session.getAttribute("Registration").toString();
            String model = session.getAttribute("Modelno").toString();
            String type = session.getAttribute("Type").toString();
            String pay = session.getAttribute("Pay").toString();
            String totalcost = "0.0";


            if (pay.equals("Paid Service")) {
                totalcost = "8500.00";
            }
            try {
                PdfWriter.getInstance(document,
                        response.getOutputStream());

                document.open();
                String d = request.getRealPath("images");
                Image image1 = Image.getInstance(d + "/cdklogo.png");
                document.add(image1);
                document.add(new Paragraph(" "));
                document.add(new Paragraph("Vehicle Service Invoice:"));
                document.add(new Chunk(" "));
                PdfPTable table = new PdfPTable(5); // 3 columns.

                PdfPCell cell1 = new PdfPCell(new Paragraph("Vehicle Registration No."));
                PdfPCell cell2 = new PdfPCell(new Paragraph("Model No."));
                PdfPCell cell3 = new PdfPCell(new Paragraph("Type of Service"));
                PdfPCell cell4 = new PdfPCell(new Paragraph("Pay"));
                PdfPCell cell5 = new PdfPCell(new Paragraph("Total Cost"));
                cell1.setBackgroundColor(BaseColor.YELLOW);
                cell2.setBackgroundColor(BaseColor.YELLOW);
                cell3.setBackgroundColor(BaseColor.YELLOW);
                cell4.setBackgroundColor(BaseColor.YELLOW);
                cell5.setBackgroundColor(BaseColor.YELLOW);
                PdfPCell cell6 = new PdfPCell(new Paragraph(regno));
                PdfPCell cell7 = new PdfPCell(new Paragraph(model));
                PdfPCell cell8 = new PdfPCell(new Paragraph(type));
                PdfPCell cell9 = new PdfPCell(new Paragraph(pay));
                PdfPCell cell10 = new PdfPCell(new Paragraph(totalcost));


                table.addCell(cell1);
                table.addCell(cell2);
                table.addCell(cell3);
                table.addCell(cell4);
                table.addCell(cell5);
                table.addCell(cell6);
                table.addCell(cell7);
                table.addCell(cell8);
                table.addCell(cell9);
                table.addCell(cell10);

                document.add(table);

                document.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("/user.jsp");
        }
    }
}




