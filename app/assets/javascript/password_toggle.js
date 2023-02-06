document.querySelector(".password-toggle-icon").addEventListener("click", () => {
  const passwordField = document.getElementById("toggle_password");
  if (passwordField.type === "password") {
    passwordField.type = "text";
  } else {
    passwordField.type = "password";
  }
});