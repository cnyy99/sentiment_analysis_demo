$('#select_control').on('change', function(){
    if ($(this).val() == 1 ) {
        $('#skill').removeClass('hide');
        $('#comment').addClass('hide');
        $('#course').addClass('hide');
    }

    if ($(this).val() == 2 ) {
        $('#skill').addClass('hide');
        $('#comment').addClass('hide');
        $('#course').removeClass('hide');
    }
    if ($(this).val() == 3 ) {
        $('#skill').addClass('hide');
        $('#comment').removeClass('hide');
        $('#course').addClass('hide');
    }
})

var myController_comment={
    loadData: function(filter) {
        return $.ajax({
            type: "GET",
            url: "/data/comments",
            data: filter,
            dataType: "JSON"
        });
    },

    insertItem: function(item) {
        return $.ajax({
            type: "POST",
            url: "/data/insertComment",
            data: item
        });
    },

    updateItem: function(item) {
        return $.ajax({
            type: "POST",
            url: "/data/updateComment",
            data: item
        });
    },

    deleteItem: function(item) {
        return $.ajax({
            type: "GET",
            url: "/data/deleteComment",
            data: item
        });
    }
};
$("#jsGrid_comment").jsGrid({
    width: "100%",
    height: "440px",
    autoload:true,
    inserting: true,
    editing: true,
    reloadAfterSubmit:true,
    localUpdate:true,
    sorting: true,
    paging: true,
    // pageLoading:true,
    pageSize: 10,
    // pageButtonCount: 5,
    // pageIndex: 1,
    afterSubmit: function () { location.reload(true); },
    loadIndication: true,
    loadIndicationDelay: 500,
    loadMessage: "Please, wait...",
    loadShading: true,
    controller:myController_comment,
    fields: [
        {name: "commentId", type: "number", width: 17, editing: false},
        {name: "userId", type: "number", width: 17, editing: false},
        {name: "userName", type: "text", width: 17, editing: false},
        {name: "commentPid", type: "number", width: 17 , editing: false},
        {name: "commentTime", type: "date", width: 27, editing: false},
        {name: "commentText", type: "textarea", width: 50, editing: false},
        {editButton: false,insertButton: false, type: "control"}
    ]
});
var myController_course={
    loadData: function(filter) {
        return $.ajax({
            type: "GET",
            url: "/data/courses",
            data: filter,
            dataType: "JSON"
        });
    },

    insertItem: function(item) {
        return $.ajax({
            type: "POST",
            url: "/data/insertCourse",
            data: item
        });
    },

    updateItem: function(item) {
        return $.ajax({
            type: "POST",
            url: "/data/updateCourse",
            data: item
        });
    },

    deleteItem: function(item) {
        return $.ajax({
            type: "GET",
            url: "/data/deleteCourse",
            data: item
        });
    }
};
$("#jsGrid_course").jsGrid({
    width: "100%",
    height: "440px",
    autoload:true,
    inserting: true,
    editing: true,
    reloadAfterSubmit:true,
    localUpdate:true,
    sorting: true,
    paging: true,
    // pageLoading:true,
    pageSize: 10,
    // pageButtonCount: 5,
    // pageIndex: 1,
    afterSubmit: function () { location.reload(true); },
    loadIndication: true,
    loadIndicationDelay: 500,
    loadMessage: "Please, wait...",
    loadShading: true,
    controller:myController_course,

    fields: [
        {name: "courseId", type: "number", width: 15, editing: false},
        {name: "courseName", type: "text", width: 33},
        {name: "courseScore", type: "number", width: 23},
        {name: "courseType", type: "text", width: 27},
        {name: "courseTerm", type: "text", width: 27},
        {name: "courseShow", type: "checkbox", width:8},
        {type: "control"}
    ]
});
var myController_skill={
    loadData: function(filter) {
        return $.ajax({
            type: "GET",
            url: "/data/skills",
            data: filter,
            dataType: "JSON"
        });
    },

    insertItem: function(item) {
        return $.ajax({
            type: "POST",
            url: "/data/insertSkill",
            data: item
        });
    },

    updateItem: function(item) {
        return $.ajax({
            type: "POST",
            url: "/data/updateSkill",
            data: item
        });
    },

    deleteItem: function(item) {
        return $.ajax({
            type: "GET",
            url: "/data/deleteSkill",
            data: item
        });
    }
};
$("#jsGrid_skill").jsGrid({
    width: "100%",
    height: "440px",
    autoload:true,
    inserting: true,
    editing: true,
    filtering: true,
    reloadAfterSubmit:true,
    localUpdate:true,
    sorting: true,
    paging: true,
    // pageLoading:true,
    pageSize: 10,
    // pageButtonCount: 5,
    // pageIndex: 1,
    afterSubmit: function () { location.reload(true); },
    loadIndication: true,
    loadIndicationDelay: 500,
    loadMessage: "Please, wait...",
    loadShading: true,
    controller:myController_skill,

    fields: [
        {name: "skillId", type: "number", width: 30, editing: false},
        {name: "skillName", type: "text", width: 30},
        {name: "skillScore", type: "number", width: 7},
        {name: "skillShow", type: "checkbox", width:3},
        {type: "control"}
    ]
});