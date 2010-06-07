(defmacro with-stopwatch (&body body)
  `(multiple-value-bind (sec0 usec0)
       (isys:gettimeofday)
     (unwind-protect
	  (progn ,@body))
     (multiple-value-bind (sec1 usec1)
	 (isys:gettimeofday)
       (+ (* 1e6 (- sec1 sec0))
	  usec1 (- usec0)))))
