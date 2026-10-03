'use strict';
const form = document.querySelector('#publicar');
form.addEventListener('submit', (event) => {
  event.preventDefault();
  let firstInvalid;
  for (const field of form.querySelectorAll('input, select, textarea')) {
    let message = '';
    if (!field.value.trim()) message = 'Completa este campo.';
    else if (field.id === 'precio' && Number(field.value) <= 0) message = 'El precio debe ser mayor que cero.';
    else if (['habitaciones', 'banos'].includes(field.id) && (!Number.isInteger(Number(field.value)) || Number(field.value) < 0)) message = 'Usa un número entero igual o mayor que cero.';
    else if (!field.checkValidity()) message = 'Revisa el valor y sus límites.';
    document.getElementById(`${field.id}-error`).textContent = message;
    field.setAttribute('aria-invalid', String(Boolean(message)));
    if (message && !firstInvalid) firstInvalid = field;
  }
  document.querySelector('#resultado').textContent = firstInvalid
    ? 'Revisa los campos señalados.'
    : 'Datos válidos. Demostración sin guardado: la publicación aún no se ha enviado.';
  firstInvalid?.focus();
});
form.addEventListener('input', () => { document.querySelector('#resultado').textContent = ''; });
