<style>
.toast {
    position: fixed;
    top: 20px;
    right: 20px;
    background: #1e90ff;
    color: white;
    padding: 14px 20px;
    border-radius: 8px;
    font-size: 15px;
    font-weight: 500;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    opacity: 0;
    transform: translateX(100%);
    transition: all 0.4s ease;
    z-index: 9999;
}

.toast.show { opacity: 1; transform: translateX(0); }

.toast.success { background: #28a745; }
.toast.error   { background: #dc3545; }
.toast.warn    { background: #ffc107; color: black; }
.toast.info    { background: #17a2b8; }
</style>

<div id="toast" class="toast"></div>

<script>
function showToast(message, type = "info") {
    const t = document.getElementById("toast");
    t.innerText = message;
    t.className = "toast show " + type;

    setTimeout(() => t.className = t.className.replace("show", ""), 3000);
}
</script>

<% if (request.getAttribute("toastMessage") != null) { %>
<script>
showToast("<%= request.getAttribute("toastMessage") %>", "<%= request.getAttribute("toastType") %>");
</script>
<% } %>
