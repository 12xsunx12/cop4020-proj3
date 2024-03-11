
; (define (name param, param1))         ~ creates a function called, "name", with two parameters, param and param1
; (cond (list? expression))             ~ creates a "if" statement, aka, "cond", that checks if the expression is a list

(define (evalu8 expression bindings)
  (cond
    ((list? expression)
     (case (car expression)
       ((+)
        (+ (evalu8 (cadr expression) bindings)
           (evalu8 (caddr expression) bindings)))
       ((*)
        (* (evalu8 (cadr expression) bindings)
           (evalu8 (caddr expression) bindings)))
       ((equal?)
        (equal? (evalu8 (cadr expression) bindings)
                (evalu8 (caddr expression) bindings)))
       ((less?)
        (< (evalu8 (cadr expression) bindings)
           (evalu8 (caddr expression) bindings)))
       (else
        (error "Unknown operation"))))
    ((number? expression) expression)
    ((symbol? expression)
     (let ((value (assoc expression bindings)))
       (if value
           (cdr value)
           (error (string-append (symbol->string expression) " is not bound")))))
    (else
     (error "Invalid expression"))))

;; Test environment
(define env '((a . 12) (b . 5) (c . 7)))

;; Test cases
(display (evalu8 '(+ a 5) env))  ; Output: 17
(newline)
(display (evalu8 '(* (+ a 5) 3) env))  ; Output: 51
(newline)
(display (evalu8 '(* (+ a 5) c) env))  ; Output: no output, will error. Error code appears to be '119' and will output that.
(newline)
