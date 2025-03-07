<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="kanban-container scrollbar" data-kanban-container="data-kanban-container">
          <div class="kanban-column scrollbar collapsed">
            <div class="kanban-column-header px-4 hover-actions-trigger">
              <div class="d-flex align-items-center border-bottom border-3 py-3 border-warning">
                <h5 class="mb-0 kanban-column-title">Unassaigned<span class="kanban-title-badge">3</span></h5>
                <div class="hover-actions-trigger">
                  <button class="btn btn-sm btn-phoenix-default kanban-header-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                  <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort all tasks</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move all tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Remove all tasks</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Import</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Export</span><span class="fas fa-angle-right fs-10"></span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move column</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Delete column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Archive column</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit title &amp; description</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit colour</span><span class="fas fa-angle-right fs-10"></span></a>
                  </div>
                </div><span class="uil uil-left-arrow-to-left fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span><span class="uil uil-arrow-from-right fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span>
              </div>
            </div>
            <div class="kanban-items-container" data-sortable="data-sortable">
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-primary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-primary"><span>Feature</span><span class="ms-1 d-inline-block fas fa-check-double" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Develop a new feature for the phoenix mobile app</p>
                    <div class="d-flex mt-2 align-items-center">
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-danger" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-danger"><span>Bug</span><span class="ms-1 d-inline-block fas fa-bug" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Conduct user research to gather feedback on the latest product iteration</p>
                    <div class="d-flex mt-2 align-items-center">
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-warning" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-warning"><span>Issue</span><span class="ms-1 d-inline-block fa-solid fa-triangle-exclamation" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Review and approve marketing materials for the upcoming product launch</p>
                    <div class="d-flex mt-2 align-items-center">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="py-3 px-4 kanban-add-task">
              <button class="btn bg-sm bg-body-tertiary me-2 px-0" data-bs-toggle="modal" data-bs-target="#kanbanAddTask"><span class="fas fa-plus text-white dark__text-gray-400" data-fa-transform="grow-4 down-1"></span></button>
              <input class="form-control search-input rounded-3 px-3" placeholder="Add new task" />
            </div>
          </div>
          <div class="kanban-column scrollbar">
            <div class="kanban-column-header px-4 hover-actions-trigger">
              <div class="d-flex align-items-center border-bottom border-3 py-3 border-300">
                <h5 class="mb-0 kanban-column-title">To do<span class="kanban-title-badge">2</span></h5>
                <div class="hover-actions-trigger">
                  <button class="btn btn-sm btn-phoenix-default kanban-header-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                  <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort all tasks</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move all tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Remove all tasks</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Import</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Export</span><span class="fas fa-angle-right fs-10"></span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move column</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Delete column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Archive column</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit title &amp; description</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit colour</span><span class="fas fa-angle-right fs-10"></span></a>
                  </div>
                </div><span class="uil uil-left-arrow-to-left fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span><span class="uil uil-arrow-from-right fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span>
              </div>
            </div>
            <div class="kanban-items-container" data-sortable="data-sortable">
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="position-relative mb-2 overflow-hidden rounded" style="height:200px; width:100%">
                      <div class="bg-holder" style="background-image:url(../../assets/img/kanban/1.jpg);">
                      </div>
                      <!--/.bg-holder-->

                    </div>
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-danger" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-danger"><span>Bug</span><span class="ms-1 d-inline-block fas fa-bug" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Test and debug code for the e-commerce website checkout process</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/30.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-warning" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-warning"><span>Issue</span><span class="ms-1 d-inline-block fa-solid fa-triangle-exclamation" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Write a blog post on industry trends and best practices</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1 me-3 white-space-nowrap"><span class="fa-solid fa-calendar-xmark fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>Jan 25</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/30.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="py-3 px-4 kanban-add-task">
              <button class="btn bg-sm bg-body-tertiary me-2 px-0" data-bs-toggle="modal" data-bs-target="#kanbanAddTask"><span class="fas fa-plus text-white dark__text-gray-400" data-fa-transform="grow-4 down-1"></span></button>
              <input class="form-control search-input rounded-3 px-3" placeholder="Add new task" />
            </div>
          </div>
          <div class="kanban-column scrollbar">
            <div class="kanban-column-header px-4 hover-actions-trigger">
              <div class="d-flex align-items-center border-bottom border-3 py-3 border-primary">
                <h5 class="mb-0 kanban-column-title">Doing<span class="kanban-title-badge">4</span></h5>
                <div class="hover-actions-trigger">
                  <button class="btn btn-sm btn-phoenix-default kanban-header-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                  <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort all tasks</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move all tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Remove all tasks</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Import</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Export</span><span class="fas fa-angle-right fs-10"></span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move column</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Delete column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Archive column</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit title &amp; description</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit colour</span><span class="fas fa-angle-right fs-10"></span></a>
                  </div>
                </div><span class="uil uil-left-arrow-to-left fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span><span class="uil uil-arrow-from-right fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span>
              </div>
            </div>
            <div class="kanban-items-container" data-sortable="data-sortable">
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-danger" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-danger"><span>Bug</span><span class="ms-1 d-inline-block fas fa-bug" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Create wireframes for a new phoenix landing page design</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1 me-3 white-space-nowrap"><span class="fa-solid fa-calendar-xmark fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>Jan 25</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <div class="avatar-name rounded-circle text-warning bg-warning-subtle"><span>R</span></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-secondary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-secondary"><span>Undefined</span><span class="ms-1 d-inline-block fas fa-spinner" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Set up and configure a new software tool for the marketing team</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa fa-check-square fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>5/34</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-primary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-primary"><span>Feature</span><span class="ms-1 d-inline-block fas fa-check-double" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Draft and send a press release to announce a new partnership</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1 me-3 white-space-nowrap"><span class="fa-solid fa-calendar-xmark fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>Jan 25</p>
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="position-relative mb-2 overflow-hidden rounded" style="height:200px; width:100%">
                      <div class="bg-holder" style="background-image:url(../../assets/img/kanban/glass.jpg);">
                      </div>
                      <!--/.bg-holder-->

                    </div>
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-warning" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-warning"><span>Issue</span><span class="ms-1 d-inline-block fa-solid fa-triangle-exclamation" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Conduct a security audit of the phoenix web applications</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1 me-3 white-space-nowrap"><span class="fa-solid fa-calendar-xmark fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>Jan 25</p>
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="py-3 px-4 kanban-add-task">
              <button class="btn bg-sm bg-body-tertiary me-2 px-0" data-bs-toggle="modal" data-bs-target="#kanbanAddTask"><span class="fas fa-plus text-white dark__text-gray-400" data-fa-transform="grow-4 down-1"></span></button>
              <input class="form-control search-input rounded-3 px-3" placeholder="Add new task" />
            </div>
          </div>
          <div class="kanban-column scrollbar">
            <div class="kanban-column-header px-4 hover-actions-trigger">
              <div class="d-flex align-items-center border-bottom border-3 py-3 border-info">
                <h5 class="mb-0 kanban-column-title">Review<span class="kanban-title-badge">4</span></h5>
                <div class="hover-actions-trigger">
                  <button class="btn btn-sm btn-phoenix-default kanban-header-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                  <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort all tasks</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move all tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Remove all tasks</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Import</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Export</span><span class="fas fa-angle-right fs-10"></span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move column</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Delete column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Archive column</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit title &amp; description</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit colour</span><span class="fas fa-angle-right fs-10"></span></a>
                  </div>
                </div><span class="uil uil-left-arrow-to-left fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span><span class="uil uil-arrow-from-right fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span>
              </div>
            </div>
            <div class="kanban-items-container" data-sortable="data-sortable">
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-warning" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-warning"><span>Issue</span><span class="ms-1 d-inline-block fa-solid fa-triangle-exclamation" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Design and develop a new logo for the phoenix</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/30.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-warning" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-warning"><span>Issue</span><span class="ms-1 d-inline-block fa-solid fa-triangle-exclamation" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Create a fresh visual identity for Phoenix with a new logo design</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa fa-check-square fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>5/34</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/30.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-secondary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-secondary"><span>Undefined</span><span class="ms-1 d-inline-block fas fa-spinner" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Identify best software vendors for company-wide system through comprehensive research and evaluation</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="position-relative mb-2 overflow-hidden rounded" style="height:200px; width:100%">
                      <div class="bg-holder" style="background-image:url(../../assets/img/kanban/wall.jpg);">
                      </div>
                      <!--/.bg-holder-->

                    </div>
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-primary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-primary"><span>Feature</span><span class="ms-1 d-inline-block fas fa-check-double" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Write and edit copy for a new email marketing campaign</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="py-3 px-4 kanban-add-task">
              <button class="btn bg-sm bg-body-tertiary me-2 px-0" data-bs-toggle="modal" data-bs-target="#kanbanAddTask"><span class="fas fa-plus text-white dark__text-gray-400" data-fa-transform="grow-4 down-1"></span></button>
              <input class="form-control search-input rounded-3 px-3" placeholder="Add new task" />
            </div>
          </div>
          <div class="kanban-column scrollbar">
            <div class="kanban-column-header px-4 hover-actions-trigger">
              <div class="d-flex align-items-center border-bottom border-3 py-3 border-success">
                <h5 class="mb-0 kanban-column-title">Release<span class="kanban-title-badge">3</span></h5>
                <div class="hover-actions-trigger">
                  <button class="btn btn-sm btn-phoenix-default kanban-header-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h"></span></button>
                  <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Sort all tasks</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move all tasks</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Remove all tasks</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Import</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Export</span><span class="fas fa-angle-right fs-10"></span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move column</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Delete column</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Archive column</span></a>
                    <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit title &amp; description</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Edit colour</span><span class="fas fa-angle-right fs-10"></span></a>
                  </div>
                </div><span class="uil uil-left-arrow-to-left fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span><span class="uil uil-arrow-from-right fs-8 ms-auto kanban-collapse-icon" data-kanban-collapse="data-kanban-collapse"></span>
              </div>
            </div>
            <div class="kanban-items-container" data-sortable="data-sortable">
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-primary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-primary"><span>Feature</span><span class="ms-1 d-inline-block fas fa-check-double" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Improve Phoenix website usability through user testing</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="position-relative mb-2 overflow-hidden rounded" style="height:200px; width:100%">
                      <div class="bg-holder" style="background-image:url(../../assets/img/kanban/home.jpg);">
                      </div>
                      <!--/.bg-holder-->

                    </div>
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-danger" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-danger"><span>Bug</span><span class="ms-1 d-inline-block fas fa-bug" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Develop and deliver a training program for new employees</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/30.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sortable-item-wrapper border-bottom border-translucent px-2 py-2">
                <div class="card sortable-item hover-actions-trigger">
                  <div class="card-body py-3 px-3">
                    <div class="kanban-status mb-1 position-relative lh-1"><span class="fa fa-circle me-2 d-inline-block text-secondary" style="min-width:1rem" data-fa-transform="shrink-1 down-3"></span><span class="badge badge-phoenix fs-10 badge-phoenix-secondary"><span>Undefined</span><span class="ms-1 d-inline-block fas fa-spinner" data-fa-transform="up-2" style="height:7.8px;width:7.8px;"></span></span>
                      <button class="btn btn-sm btn-phoenix-default kanban-item-dropdown-btn hover-actions" type="button" data-boundary="viewport" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fas fa-ellipsis-h fa-rotate-90" data-fa-transform="shrink-2"></span></button>
                      <div class="dropdown-menu dropdown-menu-end py-2" style="width: 15rem;"><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Duplicate</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to top</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Jump to bottom</span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Print/Download</span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Share</span><span class="fas fa-angle-right fs-10"></span></a>
                        <hr class="my-2" /><a class="dropdown-item d-flex flex-between-center border-1 border-translucent undefined" href="#!"><span>Move to archive</span><span class="fas fa-angle-right fs-10"></span></a><a class="dropdown-item d-flex flex-between-center border-1 border-translucent text-danger" href="#!"><span>Delete</span></a>
                      </div>
                    </div>
                    <p class="mb-0 stretched-link" data-bs-toggle="modal" data-bs-target="#KanbanItemDetailsModal">Organize and lead a brainstorming session to generate new product ideas</p>
                    <div class="d-flex mt-2 align-items-center">
                      <p class="mb-0 text-body-tertiary text-opacity-85 fs-9 lh-1"><span class="fa-solid fa-paperclip fs-9 me-2 d-inline-block" style="min-width: 1rem;"></span>15</p>
                      <div class="avatar-group ms-auto">
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/57.webp" alt="" />

                        </div>
                        <div class="avatar avatar-s  border border-light-subtle rounded-pill">
                          <img class="rounded-circle " src="../../assets/img/team/25.webp" alt="" />

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="py-3 px-4 kanban-add-task">
              <button class="btn bg-sm bg-body-tertiary me-2 px-0" data-bs-toggle="modal" data-bs-target="#kanbanAddTask"><span class="fas fa-plus text-white dark__text-gray-400" data-fa-transform="grow-4 down-1"></span></button>
              <input class="form-control search-input rounded-3 px-3" placeholder="Add new task" />
            </div>
          </div>
          <div class="kanban-column scrollbar position-relative bg-transparent">
            <div class="d-flex h-100 flex-center fw-bold bg-body-hover"><a class="text-decoration-none stretched-link text-body-secondary" href="#!">
                <div class="circle-btn bg-body-secondary mx-auto"><span class="fas fa-plus" data-fa-transform="shrink-2"></span></div><span>Add another list</span>
              </a></div>
          </div>
        </div>
</body>
</html>