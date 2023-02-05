const passwordFieldIcon = document.querySelector(".password-field-icon");
passwordFieldIcon.addEventListener("click", () => {
  togglePasswordVisibility("user_password");
});

function togglePasswordVisibility(passwordFieldId) {
  const passwordField = document.getElementById(passwordFieldId);
  if (passwordField.type === "password") {
    passwordField.type = "text";
  } else {
    passwordField.type = "password";
  }
}
