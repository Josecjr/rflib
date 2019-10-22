/*
 * Copyright (c) 2019 Johannes Fischer <fischer.jh@gmail.com>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of mosquitto nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

/**
 * @group Logger
 * @description Logger interface defining the service contract for any loggers. 
 */ 
@SuppressWarnings('PMD.ClassNamingConventions')
public interface rflib_Logger {

  /**
   * Set the number of messages to be collected by all loggers of the same execution context together.
   * If the new number size is smaller than the number of already collected messages, the oldest of those
   * messages will be removed until the number of messages matches the new size. 
   * 
   * rflib_DefaultLogger's default size is 100.
   *
   * @param  newSize The new number of messages to be collected. 
   */  
  void setLogCacheSize(Integer newSize);

  /**
   * Set the log level for which a rflib_Log_Event__c Platform Event should automatically be created. 
   * Any log statement that is added and encompassed by set reporting level, i.e. reporting log level of 
   * WARN will match for WARN and ERROR messages, will automatically create a log event.
   * 
   * rflib_DefaultLogger's default level is FATAL.
   * 
   * @param  newLevel The new log level to be used to match statements. 
   */
  void setReportingLogLevel(rflib_LogLevel newLevel);

  /**
   * Set the log level for which the System.debug() method will be invoked. Whenever a statement is logged and
   * the statements level is encompassed by the currently set System Debug Level, the message will also be logged
   * to the System.debug logs. 
   *
   * rflib_DefaultLogger's default level is INFO.
   *
   * @param  newLevel The new log level to be used to match statements.
   */
  void setSystemDebugLevel(rflib_LogLevel newLevel);

  /**
   * Set the general log level. Whenever a statement is logged and the statements level is encompassed
   * by the currently set General Log Level, the message will be added to the log stack. 
   *
   * rflib_DefaultLogger's default level is INFO.
   *
   * @param  newLevel The new log level to be used to match statements.
   */
  void setGeneralLogLevel(rflib_LogLevel newLevel);

  /**
   * Write a DEBUG log statement. 
   * @param  message The message to be logged. 
   */
  void debug(String message);

  /**
   * Write a DEBUG log statement where the message contains substitution variables to be replaced with the
   * arguments provided. See String.format() for more details. If no arguments are provided, the message will
   * be logged as is.
   *  
   * @param  message The log message possibly including substitution variables. 
   * @param  args    The Array of arguments holding the substitutions. 
   */
  void debug(String message, Object[] args);

  /**
   * Write a INFO log statement. 
   * @param  message The message to be logged. 
   */
  void info(String message);
  
  /**
   * Write a INFO log statement where the message contains substitution variables to be replaced with the
   * arguments provided. See String.format() for more details. If no arguments are provided, the message will
   * be logged as is.
   *  
   * @param  message The log message possibly including substitution variables. 
   * @param  args    The Array of arguments holding the substitutions. 
   */
  void info(String message, Object[] args);

  /**
   * Write a WARN log statement. 
   * @param  message The message to be logged. 
   */
  void warn(String message);

  /**
   * Write a WARN log statement where the message contains substitution variables to be replaced with the
   * arguments provided. See String.format() for more details. If no arguments are provided, the message will
   * be logged as is.
   *  
   * @param  message The log message possibly including substitution variables. 
   * @param  args    The Array of arguments holding the substitutions. 
   */
  void warn(String message, Object[] args);

  /**
   * Write a ERROR log statement. 
   * @param  message The message to be logged. 
   */
  void error(String message);

  /**
   * Write a ERROR log statement where the message contains substitution variables to be replaced with the
   * arguments provided. See String.format() for more details. If no arguments are provided, the message will
   * be logged as is.
   *  
   * @param  message The log message possibly including substitution variables. 
   * @param  args    The Array of arguments holding the substitutions. 
   */
  void error(String message, Object[] args);

  /**
   * Write a FATAL log statement. 
   * @param  message The message to be logged. 
   */
  void fatal(String message);

  /**
   * Write a FATAL log statement where the message contains substitution variables to be replaced with the
   * arguments provided. See String.format() for more details. If no arguments are provided, the message will
   * be logged as is.
   *  
   * @param  message The log message possibly including substitution variables. 
   * @param  args    The Array of arguments holding the substitutions. 
   */
  void fatal(String message, Object[] args);
  
  /**
   * Prints all messages to the Apex logs using System.debug() separated by lines (\\n).
   */
  void printLogs();

  /**
   * Creates a rflib_Log_Event__e Platform Event containing the value for the 'context' of the current logger
   * and a text of all messages separated by lines (\\n).
   */
  void reportLogs();
}