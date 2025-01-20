import { Directive, HostListener } from '@angular/core';

@Directive({
  selector: '[appOnlyNumbers]'
})
export class OnlyNumbersDirective {

  @HostListener('keydown', ['$event']) onKeyDown(event: KeyboardEvent) {
    // Permitir teclas de control (backspace, tab, etc.)
    const allowedKeys = ['Backspace', 'Tab', 'ArrowLeft', 'ArrowRight', 'Delete'];
    if (allowedKeys.includes(event.key)) {
      return;
    }

    // Validar si es un número
    const isNumber = /^[0-9]$/.test(event.key);
    if (!isNumber) {
      event.preventDefault(); // Bloquear entrada si no es un número
    }
  }

  @HostListener('paste', ['$event']) onPaste(event: ClipboardEvent) {
    const clipboardData = event.clipboardData?.getData('text');
    if (clipboardData && !/^\d+$/.test(clipboardData)) {
      event.preventDefault(); // Bloquear si el contenido no es numérico
    }
  }

}
