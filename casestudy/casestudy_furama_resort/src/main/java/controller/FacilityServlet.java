package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.facility.IFacilityService;
import service.facility.IFacilityTypeService;
import service.facility.IRentTypeService;
import service.facility.impl.FacilityService;
import service.facility.impl.FacilityTypeService;
import service.facility.impl.RentTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityService iFacilityService = new FacilityService();
    private IRentTypeService iRentTypeService = new RentTypeService();
    private IFacilityTypeService iFacilityTypeService = new FacilityTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "search":
                searchFacility(request, response);
                break;
            default:
                showFacilityList(request, response);
        }
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("facilityName");
        String facilityTypeName = request.getParameter("facilityTypeName");
        List<Facility> facilityList = iFacilityService.search(facilityName, facilityTypeName);
        List<FacilityType> facilityTypeList = iFacilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = iRentTypeService.showListRentType();
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> facilityTypeList = iFacilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = iRentTypeService.showListRentType();
        int id = Integer.parseInt(request.getParameter("facility_id"));
        Facility facility = iFacilityService.findById(id);
        RequestDispatcher requestDispatcher;
        if (facility == null) {
            requestDispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            request.setAttribute("facility", facility);
            request.setAttribute("facilityTypeList", facilityTypeList);
            request.setAttribute("rentTypeList", rentTypeList);
            requestDispatcher = request.getRequestDispatcher("view/facility/update.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> facilityTypeList = iFacilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = iRentTypeService.showListRentType();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/create.jsp");
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("facility_id"));
        iFacilityService.deleteFacility(id);
        try {
            response.sendRedirect("/facility");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFacilityList(HttpServletRequest request, HttpServletResponse response) {
        String msg = request.getParameter("msg");
        List<Facility> facilityList = iFacilityService.showListFacility();
        List<FacilityType> facilityTypeList = iFacilityTypeService.showListFacilityType();
        List<RentType> rentTypeList = iRentTypeService.showListRentType();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        request.setAttribute("facilityList", facilityList);
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("msg", msg);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createFacility(request, response);
                break;
            case "update":
                updateFacility(request, response);
                break;
            default:
        }
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));
        String facilityName = request.getParameter("facilityName");
        int facilityArea = Integer.parseInt(request.getParameter("facilityArea"));
        double facilityCost = Double.parseDouble(request.getParameter("facilityCost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String otherConvenience = request.getParameter("otherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));

        iFacilityService.updateFacility(new Facility(facilityId, facilityName, facilityArea, facilityCost, maxPeople, standardRoom,
                otherConvenience, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId));

        try {
            response.sendRedirect("/facility?msg=Update%20facility's%20information%20successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("facilityName");
        int facilityArea = Integer.parseInt(request.getParameter("facilityArea"));
        double facilityCost = Double.parseDouble(request.getParameter("facilityCost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String otherConvenience = request.getParameter("otherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        String facilityFree = request.getParameter("facilityFree");
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facilityTypeId"));

        boolean check = iFacilityService.addNewFacility(new Facility(facilityName, facilityArea, facilityCost, maxPeople, standardRoom,
                otherConvenience, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId));
        String mess = "Add new facility successfully!";
        if (check) {
            mess = "Can not add new facility!";
        }

        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }
}
