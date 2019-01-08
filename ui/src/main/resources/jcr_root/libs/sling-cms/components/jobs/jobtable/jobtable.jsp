<%-- /*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */ --%>
 <%@include file="/libs/sling-cms/global.jsp"%>
 <div class="reload-container" data-path="${resource.path}.html">
    <table class="table is-fullwidth is-striped">
        <thead>
            <tr>
                <th>
                    #
                </th>
                <th>
                    Job Name
                </th>
                <th>
                    Started
                </th>
                <th>
                    Finished
                </th>
                <th>
                    State
                </th>
            </tr>
        </thead>
        <tbody>
            <sling:adaptTo var="jobManager" adaptable="${slingRequest}" adaptTo="org.apache.sling.cms.CMSJobManager" />
            <c:set var="count" value="1" />
            <c:forEach var="job" items="${jobManager.jobs}">
                <tr class="sortable__row">
                    <td class="Cell-Static" title="# ${status.index + 1}" data-sort-value="<fmt:formatNumber pattern="0000" value="${count}" />">
                        ${count}
                    </td>
                    <td>
                        ${job.topic}
                    </td>
                    <td>
                        <fmt:formatDate value="${job.created.time}" type="both" dateStyle="long" timeStyle="long" />
                    </td>
                    <td>
                        <c:if test="${job.finishedDate != null}">
                            <fmt:formatDate value="${job.finishedDate.time}" type="both" dateStyle="long" timeStyle="long" />
                        </c:if>
                    </td>
                    <td>
                        <sling:encode value="${job.jobState}" mode="HTML" />
                    </td>
                </tr>
                <c:set var="count" value="${count + 1}" />
            </c:forEach> 
        </tbody>
    </table>
</div>