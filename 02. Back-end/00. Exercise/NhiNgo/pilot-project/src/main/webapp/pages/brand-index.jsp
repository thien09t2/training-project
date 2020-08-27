<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Brand Management</title>
    <jsp:include page="../common/head.jsp"/>

    <link rel="stylesheet" href="<c:url value='/css/brand.css'/> ">
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="container-fluid">
    <div class="container wrapper">
        <div class="sub-header">
            <div class="float-left sub-title">Brand Management</div>
            <div class="float-right">
                <a class="btn btn-success add-btn" href="/brand/add"><i
                        class="fas fa-plus-square"></i> Add Brand</a>
            </div>
        </div>
        <table class="table table-bordered" id="brandInfoTable">
            <thead>
            <tr class="text-center">
                <th scope="col"  width="6%">ID</th>
                <th scope="col"  width="20%">Name</th>
                <th scope="col">Logo</th>
                <th scope="col" width="40%">Description</th>
                <th scope="col" width="10%"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="brand" items="${responseData.brandList}">
                <tr>
                    <td>${brand.brandID}</td>
                    <td>${brand.brandName}</td>
                    <td class="text-center logo-cell"><img src="${brand.logo}"></td>
                    <td>${brand.description}</td>
                    <td class="action-btns" data-id="${brand.brandID}"><a
                            class="edit-btn" href="/brand/update?id=${brand.brandID}"><i
                            class="fas fa-edit"></i></a> | <a class="delete-btn"
                                                              href="/brand/delete?id=${brand.brandID}"><i
                            class="fas fa-trash-alt"></i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <c:set value="${responseData.paginationInfo}" var="paginationInfo" />
        <c:if test="${not empty paginationInfo}">
            <div class="d-flex justify-content-center">
                <ul class="pagination">
                    <li class="page-item"><a
                            href="?page=${paginationInfo.firstPage}"
                            data-index="${paginationInfo.firstPage}"
                            class="page-link ${paginationInfo.firstPage == 0 ? 'disabled' : ''}">
                        First </a></li>
                    <li class="page-item"><a
                            href="?page=${paginationInfo.prvsPage}"
                            data-index="${paginationInfo.prvsPage}"
                            class="page-link ${paginationInfo.prvsPage == 0 ? 'disabled' : ''}">
                        Previous </a></li>
                    <c:forEach items="${paginationInfo.pgNumList}" var="pgNum"
                               varStatus="loop">
                        <li class="page-item"><a href="?page=${pgNum}"
                                                 data-index="${pgNum}"
                                                 class="page-link ${pgNum == paginationInfo.currtPage ? 'active' : ''}">
                                ${pgNum} </a></li>
                    </c:forEach>
                    <li class="page-item"><a
                            href="?page=${paginationInfo.nextPage}"
                            data-index="${paginationInfo.nextPage}"
                            class="page-link ${paginationInfo.nextPage == 0 ? 'disabled' : ''}">
                        Next </a></li>
                    <li class="page-item"><a
                            href="?page=${paginationInfo.lastPage}"
                            data-index="${paginationInfo.lastPage}"
                            class="page-link ${paginationInfo.lastPage == 0 ? 'disabled' : ''}">
                        Last </a></li>
                </ul>
            </div>
        </c:if>
    </div>
</div>

<!-- Modal to Confirm Deleting Brand -->
<div class="modal fade" id="confirmDeleteModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Brand ?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Do you really want to delete brand <b class="brand-name"></b>? <br>
                    This process can not be undone.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-warning" id="delSubmmitBtn">Confirm</button>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

</body>
</html>