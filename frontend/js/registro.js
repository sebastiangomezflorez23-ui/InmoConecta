'use strict';
const form = document.querySelector('#registro');
form.addEventListener('submit', (event) => {
  event.preventDefault();
  const fields = [...form.querySelectorAll('input, select')];
  let firstInvalid;
  for (const field of fields) {
    let message = '';
    if (!field.value.trim()) message = 'Completa este campo.';
    else if (field.type === 'email' && field.validity.typeMismatch) message = 'Escribe un correo válido.';
    else if (field.type === 'password' && field.value.length < 8) message = 'Usa al menos 8 caracteres.';
    else if (!field.checkValidity()) message = 'Revisa el valor ingresado.';
    document.getElementById(`${field.id}-error`).textContent = message;
    field.setAttribute('aria-invalid', String(Boolean(message)));
    if (message && !firstInvalid) firstInvalid = field;
  }
  document.querySelector('#resultado').textContent = firstInvalid
    ? 'Revisa los campos señalados.'
    : 'Datos válidos; registro pendiente de conexión al servidor.';
  firstInvalid?.focus();
});
form.addEventListener('input', () => { document.querySelector('#resultado').textContent = ''; });
