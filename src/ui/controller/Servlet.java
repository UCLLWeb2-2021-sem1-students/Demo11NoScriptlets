package ui.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.db.DierDB;
import domain.model.Dier;
import domain.model.DierSoort;

@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DierDB dierDB = new DierDB();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
        System.out.println();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String destination;
        String command = request.getParameter("command");
        if (command == null || command.isEmpty())
            command = "";
        switch (command) {
            case "voegToeForm":
                destination = getVoegToeForm(request, response);
                break;
            case "overzicht":
                destination = getOverzicht(request, response);
                break;
            case "voegToe":
                destination = getVoegToe(request, response);
                break;
            case "zoekForm":
                destination = getZoekForm(request,response);
                break;
            case "zoek":
                destination = getZoek(request, response);
                break;
            default:
                destination = getHome(request, response);
                break;
        }

        RequestDispatcher view = request.getRequestDispatcher(destination);
        view.forward(request, response);

    }

    private String getZoek(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("gevondenDier", dierDB.vind(request.getParameter("naam")));
        return "gevonden.jsp";
    }

    private String getZoekForm(HttpServletRequest request, HttpServletResponse response) {
        return "zoek.jsp";
    }

    private String getHome(HttpServletRequest request, HttpServletResponse response) {
        return "index.jsp";
    }

    private String getVoegToeForm(HttpServletRequest request, HttpServletResponse response) {
        return "voegToe.jsp";
    }

    private String getVoegToe(HttpServletRequest request, HttpServletResponse response) {
        String destination = "voegToe.jsp";

        String naam = request.getParameter("naam");
        String voedsel = request.getParameter("voedsel");
        String soort = request.getParameter("soort");

        if (naam != null && soort != null && voedsel != null) {
            if (!naam.isEmpty() && !soort.isEmpty() && !voedsel.isEmpty()) {
                Dier dier = new Dier(naam, DierSoort.valueOf(soort), Integer.parseInt(voedsel));
                dierDB.voegToe(dier);
                request.setAttribute("alleDieren", dierDB.vindAlle());
                request.setAttribute("meestHongerige", dierDB.vindMeestHongerige());
                destination = "overzicht.jsp";
            }
        }
        return destination;

    }

    private String getOverzicht(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("alleDieren", dierDB.vindAlle());
        request.setAttribute("meestHongerige", dierDB.vindMeestHongerige());
        return "overzicht.jsp";
    }
}
